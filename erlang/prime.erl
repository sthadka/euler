-module(prime).
-export([sieve/1, is_prime/1, next_prime/1, factor/1]).


%% TODO: Create another function sieve withtout list manipulations
sieve(N) when N > 1 ->
    List = lists:seq(2, N),
    lists:reverse(sieve(2, N, List, [2])).

sieve(_Curr, _N, [], Acc) ->
    Acc;
sieve(Curr, N, _, Acc) when Curr == N ->
    Acc;
sieve(Curr, N, List, Acc) ->
    NewList = lists:filter(fun(Num) -> Num rem Curr /= 0 end, List),
    sieve(hd(NewList), N,  tl(NewList), [hd(NewList) | Acc]).

is_prime(2) ->
    true;
is_prime(N) ->
    Sqrt = round(math:sqrt(N)+0.5),
    not is_div(N, 2, Sqrt).

is_div(_N, Limit, Limit) ->
    false;
is_div(N, Num, Limit) ->
    case N rem Num == 0 of
        true ->
            true;
        false ->
            is_div(N, Num + 1, Limit)
    end.

next_prime(N) ->
    case is_prime(N + 1) of
        true ->
            N + 1;
        false ->
            next_prime(N + 1)
    end.

factor(N) ->
    factor(N, []).

factor(1, Facs) ->
    Facs;
factor(N, Facs) ->
    Sqrt = round(math:sqrt(N)+0.5),
    Fac = get_factor(N, 2, Sqrt),
    factor(N div Fac, Facs ++ [Fac]).

get_factor(N, Limit, Limit) ->
    N;
get_factor(N, Num, Limit) ->
    case N rem Num == 0 of
        true ->
            Num;
        false ->
            get_factor(N, Num + 1, Limit)
    end.


