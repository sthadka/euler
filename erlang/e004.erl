-module(e004).
-export([main/0]).

main() ->
    main(100, 0).

main(1000, Val) ->
    Val;
main(Num, Max) ->
    List = get_palins(Num),
    case List of
        [] ->
            main(Num + 1, Max);
        _ ->
            NewMax = hd(List),
            case NewMax > Max of
                true ->
                    main(Num + 1, NewMax);
                false ->
                    main(Num + 1, Max)
            end
    end.

get_palins(Num) ->
    get_palins(Num, 100, []).

get_palins(_Num, 1000, Acc) ->
    Acc;
get_palins(Num1, Num2, Acc) ->
    Prod = Num1 * Num2,
    case utils:palin(Prod) of
        true ->
            get_palins(Num1, Num2 + 1, [Prod | Acc]);
        false ->
            get_palins(Num1, Num2 + 1, Acc)
    end.
            

