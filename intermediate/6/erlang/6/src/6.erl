%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 6 Intemediate
%%% create a program that can remove all duplicate strings from a .txt. file. 
%%% for example, "bdbdb" -> "bd"
%%%  we are really sorry about this :( .. I just woke up now and am looking at this disaster. We promise to give a bonus question soon ...
%%% for those who still have time, here is the modified question:
%%% remove duplicate substrings.
%%% Ex: aaajtestBlaBlatestBlaBla ---> aaajtestBlaBla
%%% another example:
%%% aaatestBlaBlatestBlaBla aaathisBlaBlathisBlaBla aaathatBlaBlathatBlaBla aaagoodBlaBlagoodBlaBla aaagood1BlaBla123good1BlaBla123
%%% output desired: aaatestBlaBla aaathisBlaBla aaathatBlaBla aaagoodBlaBla aaagood1BlaBla123
%%% I am really sorry for the vagueness. Hopefully will not be repeated again :(F
%%%
%%% @end
%%% Created : 26 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('6').

%% API
-export([challenge/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------
challenge([A|R]) ->
    {ok, Rest, Length} = remove_substrings([A|R],R),
    case Length > length(Rest) of
        true ->
            [A|Rest];
        false ->            
            [A|challenge(Rest)]
    end;

challenge(_)->
    [].

remove_substrings(L1,L2)->
    remove_substrings(L1,L2,L1,[],[]).

remove_substrings([A|R1], [A|R2], Prefix, Acc,Match) ->
    remove_substrings(R1,R2, Prefix, Acc,[A|Match]);
remove_substrings(_,[X|R2], Prefix, Acc, Match) ->
    case length(Match) >= 3 of
        true ->
            remove_substrings(Prefix,R2,Prefix,[X|Acc],[]);
        false ->
            remove_substrings(Prefix,R2, Prefix, [X] ++ lists:reverse(Match) ++ Acc, [])
    end;
remove_substrings(_,[], Prefix, Acc, Match) ->
    case length(Match) >= 3 of
        true ->
            {ok, lists:reverse(Acc), length(Prefix) - (length(Acc) + 1)};
        false ->
            {ok,  lists:reverse(Acc) ++ lists:reverse(Match), length(Prefix) - (length(Acc) + length(Match) + 1)}
    end.


%%%===================================================================
%%% Internal functions
%%%===================================================================

