let rec power x y = 
    if y = 0 then 1
    else x * power x (y-1);;

let rec power' x y =
    if y = 0 then 1
    else if y mod 2 = 1 then x * power' (x * x) (y / 2)
    else power' (x * x) (y / 2);;

(* La segunda función es más eficiente porque evita
   cálculos repetidos y reduce las llamadas recursivas *)

let rec powerf x n =
   if n = 0 then 1.0
   else if n mod 2 = 1 then x *. powerf (x *. x) (n / 2)
   else powerf (x *. x) (n / 2);;