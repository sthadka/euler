-module(e006).
-export([main/0]).

main() ->
    N = 100,
    SumSqr = sum_sqr(N),
    SqrSum = sqr_sum(N),
    SqrSum - SumSqr.

sum_sqr(N) ->
    sum_sqr(N, 0).

sum_sqr(1, Acc) ->
    Acc + 1;
sum_sqr(N, Acc) ->
    sum_sqr(N - 1, Acc + (N * N)).

sqr_sum(N) ->
    sqr_sum(N, 0).

sqr_sum(1, Acc) ->
    (Acc + 1) * (Acc + 1);
sqr_sum(N, Acc) ->
    sqr_sum(N - 1, Acc + N).




