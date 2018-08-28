let var k =
  match Sys.getenv k with
  | v -> Printf.sprintf "%s = %S" k v
  | exception Not_found -> Printf.sprintf "%s is not set" k

let () = print_endline @@ var "X"
