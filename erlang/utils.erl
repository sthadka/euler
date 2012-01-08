-module(utils).
-export([palin/1, gcd/2, lcm/2]).

palin([]) ->
    true;
palin([_Elem]) ->
    true;
palin(Val) ->
    case is_integer(Val) of
        true ->
            NewVal = integer_to_list(Val),
            palin(NewVal);
        false ->
            First = hd(Val),
            Rev = lists:reverse(tl(Val)),
            Last = hd(Rev),
            case First == Last of
                true ->
                    palin(tl(Rev));
                false ->
                    false
            end
    end.

% GCD by euclid's algorithm
gcd(A, B) when B > A ->
    gcd(B, A);
gcd(A, 0) ->
    A;
gcd(A, B) ->
    gcd(B, A rem B).

lcm(A, B) ->
    (A * B) div gcd(A, B).

