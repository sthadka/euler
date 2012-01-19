-module(e010).
-export([one/0, two/0]).

%% Takes too long! Possibly due to lists manipulations
one() ->
    Primes = prime:sieve(2000000),
    lists:foldl(fun(X, Sum) -> X + Sum end, 0, Primes).

%% Works ok
two() ->
    runtwo(2, 0).

runtwo(P, Sum) when P < 2000000 ->
    runtwo(prime:next_prime(P), Sum + P);
runtwo(_P, Sum) ->
    Sum.
