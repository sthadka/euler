-module(e003).
-export([main/0]).

main() ->
    lists:max(prime:factor(600851475143)).
