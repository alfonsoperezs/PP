let to0from n =
  let rec construct l x =
    if x < 0 then List.rev l 
    else construct (x::l) (x-1)
  in construct [] n;;

let fromto m n =
  let rec construct x y l =
    if x > y then l 
    else construct x (y-1) (y::l)
  in construct m n [];;

let remove x l =
  let rec delete lin lout =
    match lin with
    [] -> l
   |h::t -> if x = h then List.rev_append lout t 
            else delete t (h::lout)
  in delete l [];;   

let compress l =
  let rec aux lc lnc =
    match lnc with
    [] -> List.rev lc
   |h::[] -> List.rev (h::lc)  
   |h1::h2::t -> if h1 = h2 then aux lc (h2::t)
                 else aux (h1::lc) (h2::t)
  in aux [] l;;
  
let append' l1 l2 =
  let rec aux laux l' =
    match l' with 
    [] -> List.rev_append laux l2 
   |h::t -> aux (h::laux) t  
  in aux [] l1;; 

let map' f l =
  let rec construct inl outl = 
    match inl with 
    [] -> List.rev outl
   |h::t -> construct t ((f h)::outl)
  in 
  construct l [];;

let rec fold_right' f l n = 
  let rec aux laux l' =
    match l' with
    | [] -> laux
    | h :: t -> aux (f h laux) t
  in aux n l;;

let incseg l =
  fold_right' (fun x t -> x::map' ((+) x) t) l [];;