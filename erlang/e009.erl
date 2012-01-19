-module(e009).
-export([main/0, alt/0]).

%% Brute force

main() ->
    run(1, 1, 1).

run(A, B, C) when C < 1000 ->
    case check(A, B, C) of
        true ->
            A * B * C;
        false ->
            run(A, B, C + 1)
    end;
run(A, B, _C) when B < 1000 ->
    run(A, B + 1, B + 1);
run(A, _B, _C) when A < 1000 ->
    run(A + 1, A + 1, A + 1);
run(_, _, _) ->
    false.

is_triple(A, B, C) ->
    A*A + B*B == C*C. 

check(A, B, C) ->
    case is_triple(A, B, C) of
        true ->
            A + B + C == 1000;
        false ->
            false
    end.

%% Simplifying, m(m+n) = 500, m > n; find m, n
%% a = m^2 - n^2, b = 2mn, c = m^2 + n^2

alt() ->
    altrun(2, 1).

altrun(M, N) when N < M ->
    case altcheck(M, N) of
        true ->
            (M*M - N*N) * (2*M*N) * (M*M + N*N);
        false ->
            altrun(M, N + 1)
    end;
altrun(M, _N) ->
    altrun(M + 1, 1).

altcheck(M, N) ->
    M * (M + N) == 500.
