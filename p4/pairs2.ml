let next (x,y) =
  let dImpar x y =
    match (x,y) with
    (1,y) -> (1,y + 1)
   |(x,y) -> (x - 1, y + 1)
  in 
  let dPar x y =
    match (x,y) with
    (x,1) -> (x + 1, 1)
   |(x,y) -> (x + 1, y - 1)
  in
  if (x + y - 1) mod 2 = 0 then dPar x y
  else dImpar x y;;

let rec steps_from (x,y) n =
  if n = 0 then (x,y)
  else steps_from (next(x,y)) (n-1);;

let pair n =
  steps_from (1,1) (n-1);;

let pair_i' (x,y) =
  let rec count (a,b) n =
    if x = a && y = b then n
    else count (next(a,b)) (n+1)
  in count (1,1) 1;;
(* La implementación propuesta tardaba un 
   tiempo considerable debido a que en cada 
   llamada recursiva se recorría la sucesión 
   de números (cada vez con un elemento más)
   con pair. Como solución a este problema,
   he propuesto pair_i', donde únicamente
   recorro la sucesión una sola vez hasta 
   llegar al par de números del cual queremos
   calcular la posición. *)  
