%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 37 
%%% write a program that takes
%%% input : a file as an argument
%%% output: counts the total number of lines.
%%% for bonus, also count the number of words in the file.
%%%
%%% @end
%%% Created : 23 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('37').

%% Includes
-include_lib("eunit/include/eunit.hrl").

%% API
-export([challenge/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Solves challenge 37
%% @spec
%% challenge(FileName) -> #{number_of_lines => NumberOfLines, number_of_words => NumberOfWords}.
%% @end
%%--------------------------------------------------------------------
-spec(challenge(list())-> map()).
challenge(FileName)->
    {ok,Binary} = file:read_file(FileName),
    NumberOfLines = length(string:tokens(binary:bin_to_list(Binary),"\n")),
    NumberOfWords = lists:foldl(fun(E,A)-> A + length(string:tokens(E," ")) end ,0, string:tokens(binary:bin_to_list(Binary), "\n")),
    #{number_of_lines => NumberOfLines, number_of_words => NumberOfWords}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

challenge_test()->
    Result = challenge("test.txt"),
    {ok, Lines} = maps:find(number_of_lines, Result),
    {ok, Words} = maps:find(number_of_words, Result),
    Lines = 5,
    Words = 8.
