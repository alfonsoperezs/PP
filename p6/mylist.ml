let hd = function (h::_) -> h;;

let tl = function (h::t) -> t;;

let rec length = function
    [] -> 0
    | _::t -> 1 + length t;;

let rec compare_lengths l1 l2 =
    match (l1,l2) with
    ([], []) -> 0
    | ([], _) -> -1
    | (_, []) -> 1
    | (_::l1, _::l2) -> compare_lengths l1 l2;;

let rec compare_length_with l n =
  match (l,n) with
  ([], 0) -> 0
 |([], _) -> -1
 |(_, 0) -> 1
 |(_::l, n) -> compare_length_with l (n-1);; 

let init len f =
  let rec construct l i = 
    if i > -1 then construct (f i::l) (i - 1)
    else l
  in
  construct [] (len - 1);;  

let rec nth l pos =
  match (l,pos) with
  (l::_, 0) -> l
 |(_::l, pos) -> nth l (pos - 1);;
 
let rec append l1 l2 = 
  match l1 with
    [] -> l2
  | h::t -> h::append t l2;;

let rec rev_append l1 l2 = 
  match l1 with
    [] -> l2
  | h::t -> rev_append t (h::l2);;

let rev l =
  rev_append l [];;

let concat l = 
  let rec operation inl outl =
    match inl with 
    [] -> outl
  | []::t -> operation t outl
  | (h::t)::r -> operation r (append outl (h::t))
  in 
  operation l [];;

let flatten l = 
  let rec operation inl outl =
    match inl with 
    [] -> outl
  | []::t -> operation t outl
  | (h::t)::r -> operation r (append outl (h::t))
  in 
  operation l [];;

(* Split recursiva terminal*)
(* let split l =
  let rec separate inl l1 l2 =
    match inl with 
    [] -> (rev l1,rev l2)
  | (x,y)::t -> separate t (x::l1) (y::l2)
  in
  separate l [] [];; *)

let rec split =
  function
  [] -> ([],[])
 |(x,y)::t -> let (t1,t2) = split t 
              in (x::t1,y::t2);;  

(* Combine recursiva terminal*)
(* let combine l1 l2 =
  let rec operation list1 list2 l =
    match (list1,list2) with 
    ([],[]) -> rev l
   |(h1::t1,h2::t2) -> operation t1 t2 ((h1,h2)::l)
  in 
  operation l1 l2 [];; *)

let rec combine l1 l2 =
  match (l1,l2) with
  ([],[]) -> []
 |(h1::t1,h2::t2) -> let t = combine t1 t2
                     in ((h1,h2)::t);; 

(* map recursiva terminal *)
(*let map f l =
  let rec construct inl outl = 
    match inl with 
    [] -> rev outl
   |h::t -> construct t ((f h)::outl)
  in 
  construct l [];;*)
  
let rec map f l =
  match l with
  [] -> []
 |h::t -> let tl = map f t in f h::tl;;

(* map2 recursiva terminal *) 
(*let map2 f l1 l2 =
  let rec construct inl1 inl2 outl = 
    match (inl1,inl2) with 
    ([],[]) -> rev outl
   |(h1::t1,h2::t2) -> construct t1 t2 ((f h1 h2)::outl)
  in 
  construct l1 l2 [];;*)

  
let rec map2 f l1 l2 =
  match (l1, l2) with
  ([], _) | (_, []) -> []
 |(x1 :: tl1, x2 :: tl2) -> f x1 x2::map2 f tl1 tl2;;


let rev_map f l =
  let rec construct inl outl = 
    match inl with 
    [] -> outl
   |h::t -> construct t ((f h)::outl)
  in 
  construct l [];;  

let rec for_all f l =
  match l with 
  [] -> true
  |h::t -> if f h = true then for_all f t 
          else false;; 

let rec exists f l =
  match l with
  [] -> false
 |h::t -> if f h = true then true
          else exists f t;; 

let rec mem a l =
  match l with
  [] -> false
 |h::t -> if h = a then true
          else mem a t;; 

let rec find f l =
  match l with
  h::t -> if f h = true then h 
          else find f t;; 

let filter f l =
  let rec operation inl outl =
    match inl with
    [] -> rev outl
   |h::t -> if f h = true then operation t (h::outl)
            else operation t outl
  in
  operation l [];;

let find_all f l = 
  let rec operation inl outl =
    match inl with
    [] -> rev outl
   |h::t -> if f h = true then operation t (h::outl)
            else operation t outl
  in
  operation l [];;

let partition f l =
  let rec separate inl l1 l2 =
    match inl with
    [] -> (rev l1, rev l2)
   |h::t -> if f h = true then separate t (h::l1) l2
            else separate t l1 (h::l2)
  in
  separate l [] [];;

let rec fold_left f n l =
  match l with 
  [] -> n 
 |h::t -> fold_left f (f n h) t;; 

let rec fold_right f l n =
  match l with
  [] -> n
 |h::t -> f h (fold_right f t n);; 

let rec assoc n l =
  match l with
  (x,y)::t -> if x = n then y
              else assoc n t;;

let rec mem_assoc n l =
  match l with
  [] -> false
 |(x,y)::t -> if x = n then true
              else mem_assoc n t;;
  
let remove_assoc n l =
  let rec construct inl n outl =
    match inl with
    | [] -> rev outl
    | (x, y) :: t ->
      if x = n then construct t n outl
      else construct t n ((x, y)::outl)
  in
  construct l n [];;
