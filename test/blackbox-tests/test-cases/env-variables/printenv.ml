let var_to_string k =
  try Sys.getenv k with
  | Not_found -> "(unset)"

let print_var k =
  Printf.printf "%s=%s\n" k (var_to_string k)

let () =
  print_var "VARIABLE_FROM_WORKSPACE"
