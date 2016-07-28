%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 9 Intermediate
%%% Write a program that will take a string ("I LIEK CHOCOLATE MILK"), 
%%% and allow the user to scan a text file for strings that match. 
%%% after this, allow them to replaces all instances of the string with 
%%% another ("I quite enjoy chocolate milk. hrmmm. yes.")
%%% @end
%%% Created : 28 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('9').

%% API
-export([challenge/2]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------
challenge(String, Replacement)->
    File = read_file("usdeclar.txt"),
    {ok, MP} = re:compile(String),
    case re:run(File,MP, [global]) of
        nomatch ->
            io:format("zero matches ~n", []);
        {match, Captures} -> 
            io:format("~p matches: ~n", [length(Captures)]),
            lists:foreach(fun([{Position, Length}]) -> 
                                  io:format("position: ~p, length: ~p ~n", [Position, Length])
                          end, Captures)
    end,
    re:replace(File, MP, Replacement, [global]).


%%%===================================================================
%%% Internal functions
%%%===================================================================

read_file(FileName)->
    {ok,Binary} = file:read_file(FileName),
    binary:bin_to_list(Binary).
