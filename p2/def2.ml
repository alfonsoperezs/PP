(*Una funci ́on p : float -> float que haga corresponder a cada n ́umero no negativo
el per ́ımetro de la circunferencia que tenga como radio ese n ́umero (no importa lo
que suceda con los negativos)*)
let p = function r -> 2. *. 3.14 *. r;;

(*Una funci ́on area : float -> float que haga corresponder a cada n ́umero no
negativo el  ́area del c ́ırculo que tenga como radio ese n ́umero (no importa lo que
suceda con los negativos).*)
let area = function r -> 3.14 *. r *. r;;

(*Una funci ́on absf : float -> float que haga correponder a cada n ́umero su valor
absoluto*)
let absf = function num -> if(num >= 0.0) then num
    else num *. (-1.0);; 

(*Una funci ́on even : int -> bool de modo que, al aplicarla a cualquier entero,
el resultado que devuelva indique si el entero es par. Intente que la definci ́on sea
lo m ́as concisa posible (pista: intente evitar el uso de expresiones if-then-else
innecesarias).*)
let even = function num -> (num mod 2 == 0);;

(*Una funci ́on next3 : int -> int que haga corresponder a cada entero el menor
m ́ultiplo de 3 que sea mayor o igual que  ́el.*)
let next3 = function numero -> if(numero mod 3 == 0) then 3 * (numero / 3)
                              else 3 * ((numero / 3) +1);;

(*Una funci ́on is a letter : char -> bool que devuelva true en los caracteres de
la ’a’ a la ’z’ (tanto may ́usculas como min ́usculas) y false en los dem ́as. A estos
efectos, s ́olo consideraremos como ”letras” los caracteres del alfabeto ingl ́es (es decir,
quedan excluidas la ’~n’, la ’ ̧c’, las letras con tilde, etc.).*)
let is_a_letter = function letter -> 
  (Char.code 'A' <= int_of_char(letter) && int_of_char(letter) <= Char.code 'Z') 
  || (Char.code 'a' <= int_of_char(letter) && int_of_char(letter) <= Char.code 'z');;

(*Y por  ́ultimo, redefina la funci ́on string of bool : bool -> string, de modo que
devuelva (adecuadamente) los valores "verdadero" o "falso" (puede hacerse una
definici ́on por casos o utilizarse una expresi ́on if-then-else)*)
let string_of_bool = function true -> "true" | false -> "false";;