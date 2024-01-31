(*Un valor v de tipo int a partir de una expresion que contenga al menos una funci ́on
predefinida*)
let v = int_of_float(3.6);;

(*Un valor w de tipo float a partir de una expresion que contenga al menos 4
operadores infijos.*)
let w = (7.0 +. 3.5 -. 1.3) /. (1.0 *. 2.0);;

(*Un valor x de tipo char a partir de una expresion que contenga una frase
if-then-else.*)
let x = if(w < 3.) then 'm' else 'M';;

(*Un valor y de tipo bool a partir de una expresion que contenga una o m ́as funciones
u operadores*)
let y = (v < int_of_float(w)) && (v > 3);;

(*Un valor z de tipo string a partir de una expresion que contenga una sub-expresi ́on
de tipo int*)
let z = string_of_int (59 + 3);;
