%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 5 Intermediate
%%% Your challenge today is to write a program that can find the amount of anagrams within a .txt file. 
%%% For example, "snap" would be an anagram of "pans", and "skate" would be an anagram of "stake".
%%%
%%% @end
%%% Created : 25 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('5').

%% API
-export([challenge/0]).

%%%===================================================================
%%% API
%%%===================================================================


%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

challenge()->
    Words = read_file("usdeclar.txt"),
    lists:filter(fun({_,Anagrams})-> length(Anagrams) > 1 end, lists:foldl(fun(E,A)-> 
                                                                                   case lists:keyfind(E,1,A) of 
                                                                                       false -> 
                                                                                           [count_anagrams(E,Words)|A];
                                                                                       _ -> 
                                                                                           A
                                                                                               end
                                                                           end, [], Words)).

%%%===================================================================
%%% Internal functions
%%%===================================================================

read_file(FileName)->
    {ok,Binary} = file:read_file(FileName),
    Res = lists:usort(string:tokens(lists:flatten(string:tokens(string:to_lower(binary:bin_to_list(Binary)), "\n"))," ")),
    Res.


count_anagrams(Word, Text)->
    Anagrams = lists:foldl(fun(E,A)-> 
                                   case length(Word) =:= length(E) andalso length(lists:filter(fun(Char) -> lists:member(Char, Word) end, E)) =:= length(Word) andalso length(lists:filter(fun(Char) -> lists:member(Char, E) end, Word)) =:= length(E)of
                                       true ->
                                           case length(Word) =:= length(E) andalso not lists:member(E,A) of 
                                               true ->
                                                   [E|A];
                                               _ -> A
                                           end;
                                       false ->
                                           A
                                   end
                           end, [], Text),
    {Word, Anagrams}.
