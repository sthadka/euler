-module(e002).
-export([main/0]).

main() ->
    main(1, 1, 0).

main(_Prev, Curr, Sum) when Curr >= 4000000 ->
    Sum;
main(Prev, Curr, Sum) ->
    case Curr rem 2 == 0 of
        true ->
            main(Curr, Prev + Curr, Sum + Curr);
        false ->
            main(Curr, Prev + Curr, Sum)
    end.
