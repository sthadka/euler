-module(e005).
-export([brute_even/1, lcm_even/1]).

brute_even(N) ->
    even(N, N + 1).

even(Limit, Curr) ->
    case is_even(Curr, Limit) of
        true ->
            Curr;
        false ->
            even(Limit, Curr + 1)
    end.

is_even(Curr, Limit) ->
    is_even(Curr, 1, Limit).

is_even(_Curr, Num, Limit) when Num > Limit ->
    true;
is_even(Curr, Num, Limit) ->
    case Curr rem Num == 0 of
        true ->
            is_even(Curr, Num + 1, Limit);
        false ->
            false
    end.

lcm_even(N) ->
    lcm_even(1, N, 1).

lcm_even(Limit, Limit, Acc) ->
    Acc;
lcm_even(Num, Limit, Acc) ->
    lcm_even(Num + 1, Limit, utils:lcm(Num, Acc)).
