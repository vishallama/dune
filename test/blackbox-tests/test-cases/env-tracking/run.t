Aliases without a (env) dependency are not rebuilt when the environment changes:

  $ dune build @without_dep
             a alias without_dep
  X is not set
  $ X=x dune build @without_dep

But if there is a dependency, the alias gets rebuilt:

  $ dune build @with_dep
             a alias with_dep
  X is not set
  $ X=x dune build @with_dep
             a alias with_dep
  X = "x"
