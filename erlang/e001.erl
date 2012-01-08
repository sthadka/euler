-module(e001).
-export([main/0]).

main() ->
    main(0, 0).

main(1000, Sum) ->
    Sum;
main(Num, Sum) ->
    case is_multiple(Num) of
        true ->
            main(Num + 1, Sum + Num);
        false ->
            main(Num + 1, Sum)
    end.

is_multiple(Num) ->
    case Num rem 3 == 0 of
        true ->
            true;
        false ->
            case Num rem 5 == 0 of
                true ->
                    true;
                false ->
                    false
            end
    end.






