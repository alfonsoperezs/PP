let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let rec orbit n =
    let f i = if i mod 2 = 0 then i / 2 
              else 3 * i + 1
    in
    if n = 1 then string_of_int n
    else(
      string_of_int n ^ ", " ^ orbit (f n)
    );;
      

let rec length n =
  let f i = if i mod 2 = 0 then i / 2 
  else 3 * i + 1
  in
  if n = 1 then 0
  else 1 + length (f n);;

let top n =
  let f i = if i mod 2 = 0 then i / 2 
  else 3 * i + 1
  in
  let rec high_value x y = if y = 1 then max x y
  else high_value (max x y) (f y)
  in
  high_value n (f n);; 

let length'n'top n =
  let f i = if i mod 2 = 0 then i / 2 
  else 3 * i + 1
  in
  let rec calculate length top orbit = 
      if orbit = 1 then (length, top)
      else calculate (1 + length) (max top orbit) (f orbit)
  in
  calculate 0 1 n;;

let longest_in m n =
  let f i = 
    if i mod 2 = 0 then i / 2 
    else 3 * i + 1
  in
  let rec length num =
    if num = 1 then 0
    else 1 + length (f num)
  in 
  let rec calculate (x,y) z =
    if z > n then (x,y)
    else let m = length z in
    if m > y then calculate (z,m) (z+1)
    else calculate (x,y) (z+1)
  in
  calculate (0,0) m;;  

let highest_in m n =
  let f i = 
    if i mod 2 = 0 then i / 2 
    else 3 * i + 1
  in
  let top num =
    let rec high_value a b = if b = 1 then max a b
    else high_value (max a b) (f b)
    in
    high_value num (f num)
  in
  let rec calculate (x,y) z =
    if z > n then (x,y)
    else let value = top z in
      if value > y then calculate (z,value) (z + 1)
      else calculate (x,y) (z + 1)
  in
  calculate (0,0) m;;

