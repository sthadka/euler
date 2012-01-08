-module(e007).
-export([main/0]).

main() ->
    N = 10001,
    primeth(N).

primeth(N) ->
    primeth(1, N, 2).

primeth(Limit, Limit, Prime) ->
    Prime;
primeth(Curr, Limit, Prime) ->
    primeth(Curr + 1, Limit, prime:next_prime(Prime)).

