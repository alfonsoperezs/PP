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