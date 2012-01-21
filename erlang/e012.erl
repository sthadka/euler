-module(e012).
-export([main/0]).

main() ->
    run(1).

run(Num) ->
    TNum = triangle_num(Num),
    PFactors = prime:factor(TNum),
    Exponents = exp_count(PFactors, []),
    case num_divisors(Exponents, 1) > 500 of
        true ->
            TNum;
        false ->
            run(Num + 1)
    end.

num_divisors([], Div) ->
    Div;
num_divisors([{_Factor, Count} | Rest], Div) ->
    num_divisors(Rest, Div * (Count + 1)).

exp_count([], Acc) ->
    Acc;
exp_count([H|List], Acc) ->
    case lists:keyfind(H, 1, Acc) of
        false ->
            exp_count(List, [{H, 1} | Acc]);
        {H, Count} ->
            exp_count(List, lists:keyreplace(H, 1, Acc, {H, Count+1}))
    end.


triangle_num(Num) ->
    trunc((Num * (Num + 1)) / 2).

