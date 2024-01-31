let bigl = List.init 500_000 succ;;

let insert_t x l =
  let rec aux laux =
    function
    [] -> List.rev (x::laux)
   |h::t -> if x <= h then 
            List.rev_append (x::laux) (h::t)
            else aux (h::laux) t
  in  
  aux [] l;; 
  
let isort_t l = 
  let rec aux laux inl =
    match inl with
    [] -> laux
   |h::t -> aux (insert_t h laux) t
  in
  aux [] l;;

let rlist i =
  let rec construct l x =
    match x with
    0 -> l 
   |_ -> construct ((Random.int i)::l) (x-1)
  in 
  construct [] i;;  

(* let crono f x =
let t = Sys.time () in
let _ = f x in
Sys.time () -. t;; *)

let lc1 = List.init 10_000 succ;;
let lc2 = List.init 20_000 succ;;
let ld1 = List.rev lc1;;
let ld2 = List.rev lc2;;
let lr1 = rlist 10_000;;
let lr2 = rlist 20_000;;

(* Tras medir los tiempos de ejecución para ambas versiones
del algoritmo de inserción (isort y isort_t), se ha obtenido
los siguientes resultados.

En primer lugar, tras duplicar el número de elementos de una
lista creciente, en la versión "isort" la diferencia es 
mínima, ya que se encuentra en el mejor caso. Sin 
embargo, para la versión "isort_t", el tiempo de ejecución
se cuatriplica, ya que se trata de su peor caso.

En segundo lugar, al duplicar el tamaño de una lista 
decreciente, ocurriría lo inverso respecto el anterior caso.
Mientras que "isort" se encuentra en su peor caso y el tiempo
se cuatriplica, en "isort_t" la diferencia es casi inapreciable.

Por último, al duplicar una lista de números aleatorios, en 
ambas versiones se observa una diferencia notable (se multiplica
por cinco el tiempo). Esta similitud en el tiempo de ejecución 
se debe a que para ambas versiones se encuentra en el caso medio.

Observando el tiempo de ejecución de ordenar lr2, mientras a
"isort" le lleva 4.74s, a "isort_t" le lleva 6.54s. Esta diferencia
se puede deber principalmente a que mientras la primera versión
inserta en la lista de manera directa, mientras que en la otra
se invierte la lista. *)

let insert_g f x l =
  let rec aux laux =
    function
    [] -> List.rev (x::laux)
   |h::t -> if f x h then 
            List.rev_append (x::laux) (h::t)
            else aux (h::laux) t
  in  
  aux [] l;; 
  
let isort_g f l = 
  let rec aux laux inl =
    match inl with
    [] -> laux
   |h::t -> aux (insert_g f h laux) t
  in
  aux [] l;;

let bigl2 = List.init 150_000 succ;;

let split_t l =
  let rec separar lin l1 l2 =
    match lin with
    [] -> l1,l2
   |[h] -> h::l1, l2
   |h1::h2::t -> separar t (h1::l1) (h2::l2)   
  in 
  separar l [] [];;  

let merge_t (l1,l2) =
  let rec construct il1 il2 ol =
    match il1, il2 with
    [], l | l, [] ->  (List.rev_append ol l)
   |h1::t1,h2::t2 -> if h1 <= h2 then
                      construct t1 il2 (h1::ol)
                     else
                      construct il1 t2 (h2::ol)
  in
  construct l1 l2 [];;

let rec msort' l = match l with
  [] | [_] -> l
  | _ -> let l1, l2 = split_t l
  in merge_t (msort' l1, msort' l2);;

let bigl3 = [];;

(* Tras medir los tiempos de ejecución de msort', se pudo observar
que tarda prácticamente el mismo tiempo para cualquier lista. Mientras
que para las listas de 10_000 elementos tarda 0.025s, para las de 
20_000 elementos tarda 0.05s. Esto nos da a entender que no existe
ni peor caso ni mejor caso para dicho algoritmo.

Por otro lado, tras ejecutar msort con listas aleatorias, se aprecia
un menor tiempo de ejecución con respecto a msort' (0.020 y 0.041 
frente a 0.029 y 0.045). La principal causa es que merge_t invierte
el orden de los elementos de la lista, operación que no realiza la 
versión no terminal. *)

let merge_g f (l1,l2) =
  let rec construct il1 il2 ol =
    match il1, il2 with
    [], l | l, [] ->  (List.rev_append ol l)
   |h1::t1,h2::t2 -> if f h1 h2 then
                      construct t1 il2 (h1::ol)
                     else
                      construct il1 t2 (h2::ol)
  in
  construct l1 l2 [];;

let rec msort_g f l = match l with
  [] | [_] -> l
  | _ -> let l1, l2 = split_t l
  in merge_g f (msort_g f l1, msort_g f l2);;



