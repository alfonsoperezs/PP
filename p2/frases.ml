(* x - y;; *)
(* Error: Unbound value x *)
(* error de compilación porque x e y no han sido declaradas previamente *)

let x = 1;;
(* val x : int = 1 *)

(* x - y;;*)
(*Error: Unbound value y*)
(* error de compilación porque y no ha sido declarada previamente*)

let y = 2;;
(*val y : int = 2*)

x - y;;
(* - : int = -1 *)

let x = y in x - y;;
(*- : int = 0*)

x - y;;
(*- : int = -1*)

(* z;; *)
(*Error: Unbound value z*)
(* error de compilación porque z no ha sido declarada previamente*)

let y = 5 in x + y;;
(*- : int = 6*)

x+y;;
(*- : int = 3*)

(*let x = x + y in let y = x * y in x + y + z;;*)
(*Error: Unbound value z*)
(*error de compilación porque z no ha sido declarada previamente*)

(*x + y + z;;*)
(*Error: Unbound value z*)
(* z no ha sido declarada previamente*)

function x -> 2 * x;;
(*- : int -> int = <fun>*)

(function x -> 2 * x) (2 + 1);;
(*- : int = 6*)

(function x -> 2 * x) 2 + 1;;
(*- : int = 5*)

let f = function x -> 2 * x;;
(*val f : int -> int = <fun>*)

f;;
(*int -> int = <fun>*)

f (2+1);;
(*- : int = 6*)

f 2 +1;;
(*- : int = 5*)

f x;;
(*- : int = 2*)

let x = 100;;
(*val x : int = 100*)

f x;;
(*- : int = 200*)

let m = 1000;;
(*val m : int = 1000*)

let g = function x -> x + m;;
(*val g : int -> int = <fun>*)

g;;
(*- : int -> int = <fun>*)

g 3;;
(*- : int = 1003*)

(*g 3.0;;*)
(*Error: This expression has type float but an expression was expected of type int *)
(*error en tiempo de ejecución porque se debe pasar como argumento un numero tipo entero*)

let m = 7;;
(*val m : int = 7*)

g 3;;
(* - : int = 1003*)

let istrue = function true -> true;;
(*Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
false
val istrue : bool -> bool = <fun> *)
(*puede provocar error de ejecución dependiendo de la entrada*)

istrue;;
(*- : bool -> bool = <fun>*)

istrue (1<2);;
(*- : bool = true*)

(*istrue (2<1);;*)
(*Exception: Match_failure ("//toplevel//", 1, 13).*)
(*error de ejecución porque la entrada de la función es false*)

(*istrue 0;;*)
(*Error: This expression has type int but an expression was expected of type bool*)
(* error de compilación porque se debe pasar como argumento un valor de tipo bool*)

let iscero_v1 = function 0 -> true;;
(*Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
1
val iscero_v1 : int -> bool = <fun>
*)
(*puede provocar error de ejecución dependiendo de la entrada*)

iscero_v1 0;;
(*- : bool = true*)

(*iscero_v1 0.;;*)
(*Error: This expression has type float but an expression was expected of type int*)
(* error de compilación porque se debe pasar como argumento un valor de tipo int*)

(*iscero_v1 1;;*)
(*Exception: Match_failure ("//toplevel//", 1, 16).*)
(*error de ejecución porque la entrada de la función es distinta de 0*)

let iscero_v2 = function 0 -> true | _ -> false;;
(*val iscero_v2 : int -> bool = <fun>*)

iscero_v2 0;;
(*- : bool = true*)

iscero_v2 1;;
(*- : bool = false*)

(*iscero_v2 0.;;*)
(*Error: This expression has type float but an expression was expected of type int*)
(* error de compilación porque se debe pasar como argumento un valor de tipo int*)

let all_to_true = function true -> true | false -> true;;
(*val all_to_true : bool -> bool = <fun>*)

all_to_true (1<2);;
(*- : bool = true*)

all_to_true (2<1);;
(*- : bool = true*)

(*all_to_true 0;;*)
(*Error: This expression has type int but an expression was expected of type bool*)
(* error de compilación porque se debe pasar como argumento un valor de tipo bool*)

let first_all_to_true = all_to_true;;
(*val first_all_to_true : bool -> bool = <fun>*)

let all_to_true = function x -> true;;
(*val all_to_true : 'a -> bool = <fun>*)

all_to_true(1<2);;
(*- : bool = true*)

all_to_true(2<1);;
(*- : bool = true*)

all_to_true 0;;
(*- : bool = true*)

(*first_all_to_true 0;;*)
(*Error: This expression has type int but an expression was expected of type bool*)
(* error de compilación porque se debe pasar como argumento un valor de tipo bool*)
