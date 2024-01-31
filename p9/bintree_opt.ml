let rec is_bst f t =
  let v = function
    | Node (x, _, _) -> x
    | Empty -> failwith "Empty"
  in
  match t with
  | Empty -> true
  | Node (r, i, d) -> 
      (match i with
      | Empty -> true
      | Node (_, _, _) -> f (v i) r) &&
      (match d with
      | Empty -> true
      | Node (_, _, _) -> f r (v d)) && is_bst f i && is_bst f d;;

let bfs tree =
  let rec aux queue list =
    match queue with
    [] -> List.rev list
   | Empty :: t  -> aux t list
   | Node(r,i,d)::t -> aux (t @ [i;d]) (r::list)
  in aux (tree::[]) [];;

let bfs' tree =
  let rec aux queue list =
    match queue with
    [] -> List.rev list
   | Empty :: t  -> aux t list
   | Node(r,i,d)::t -> aux (t @ [i;d]) (r::list)
  in aux (tree::[]) [];;

let rec perfecto tree =
  match tree with
  Empty -> true
 |Node(r,Empty,Empty) -> true
 |Node(r,c,Empty) | Node(r,Empty,c) -> false
 |Node(r,i,d) -> perfecto i && perfecto d;;
 
let rec casi_perfecto tree =
  match tree with
  Empty -> true
 |Node(r,Empty,Empty) -> true
 |Node(r,c,Empty) -> true 
 |Node(r,Empty,c) -> false
 |Node(r,i,d) -> (casi_perfecto i && casi_perfecto d) || 
                 (casi_perfecto i && not (casi_perfecto d));;

    
