let rec reverse n =
    let rec num_cifras n =
      if n < 10 then
        1
      else
        1 + num_cifras (abs(n) / 10)
    in
    let rec exp10 = function 0 -> 1 | 1 -> 10 | n -> 10 * exp10 (n - 1)
    in
    if n < 10 then
      n
    else
    exp10(num_cifras n - 1) * (n mod 10) + reverse (n / 10);;


let rec palindromo s = 
    let longitud = String.length s in
    if longitud <= 1 then true
    else if String.get s 0 = String.get s(longitud - 1) then
        palindromo (String.sub s 1 (longitud - 2))
    else false;;

let rec mcd (x,y) =
    if x = 0 then y
    else if y = 0 then x
    else if x > y then mcd ((x mod y), y)
    else mcd (x, (y mod x));;

