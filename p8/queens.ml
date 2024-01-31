let come (i1,j1) (i2,j2) =
  i1 = i2 || j1 = j2 || abs (i2 - i1) = abs (j2 - j1);;

let compatible p l =
  not (List.exists (come p) l);;

let queens n =
  let rec completa path i j =
    if i > n then [path] 
    else if j > n then [] 
    else if compatible (i, j) path then
      completa ((i, j) :: path) (i + 1) 1 @ completa path i (j + 1)
    else
      completa path i (j + 1)
  in completa [] 1 1;;

let is_queens_sol n l =
  if List.length l != n then false
  else let rec check_sol valid_l sol =
         match sol with
         [] -> true
        |(i,j)::t -> if compatible (i,j) t then 
                      check_sol ((i,j)::valid_l) t 
                     else false
  in
  check_sol [] l;; 

    








  