open Stdune

type t

val of_string_exn : loc:Loc.t option -> string -> t
val to_string : t -> string

include Dsexp.Sexpable with type t := t

module Local : sig
  type t

  type result =
    | Ok of t
    | Warn of t
    | Invalid

  val dgen : t Dsexp.To_sexp.t
  val dparse_loc : (Loc.t * result) Dsexp.Of_sexp.t
  val validate : (Loc.t * result) -> wrapped:bool -> t

  val to_sexp : t Sexp.To_sexp.t

  val of_string_exn : string -> t

  val of_string : string -> result

  val to_string : t -> string

  val invalid_message : string

  val pp_quoted : t Fmt.t
end

val compare : t -> t -> Ordering.t

val pp : t Fmt.t

val pp_quoted : t Fmt.t

val of_local : Local.t -> t

val to_local : t -> Local.result

val split : t -> Package.Name.t * string list

val package_name : t -> Package.Name.t

val root_lib : t -> t

module Map : Map.S with type key = t
module Set : sig
  include Set.S with type elt = t
  val to_string_list : t -> string list
end

val to_sexp : t Sexp.To_sexp.t

val nest : t -> t -> t

module L : sig
  val to_key : t list -> string
end
