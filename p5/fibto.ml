let rec fib n =
  if n <= 1 then n
  else fib (n-1) + fib (n-2);;

let print_nums n =
  let rec print_fib i =
    let j = fib i in
    if j <= n then (
      print_int (j);
      print_newline ();
      print_fib (i + 1)
    )
  in
  print_fib 0;;

let () = 
    if Array.length (Sys.argv) <> 2 then
      print_endline "fibto: Invalid number of arguments"
    else
      let n = int_of_string Sys.argv.(1) in
      print_nums n;;
    