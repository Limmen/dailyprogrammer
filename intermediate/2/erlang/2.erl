%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 2
%%%
%%% Create a short text adventure that will call the user by their name. 
%%% The text adventure should use standard text adventure commands ("l, n, s, e, i, etc.").
%%% For extra credit, make sure the program doesn't fault, quit, glitch, fail, or loop no matter what is put in, even empty text or spaces. 
%%% These will be tested rigorously!
%%%
%%% @end
%%% Created : 23 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('2').

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
    io:format("MILORD! THE ENEMY HAS ARRIVED. WHAT WILL YOU DO? ~n",[]),
    repl(1).

%%%===================================================================
%%% Internal functions
%%%===================================================================

repl(Enemy)->
    case lists:nth(1, string:tokens(io:get_line("> "),"\n")) of
        [$s] ->
            io:format("YOU SHOOT AN ARROW BUT MISSED!~n",[]),
            repl(Enemy);
        [$r] ->
            io:format("YOU RUN INTO A WINDOW ~n",[]),
            io:format("YOU DIE BUT YOU HAVE KILLED ~p ENEMIES ~n", [Enemy-1]),
            exit(died);
        [$a] ->
            io:format("YOU SWING YOUR SWORD ~n Enemy ~p Down ~n", [Enemy]),
            repl(Enemy + 1);
        [$k] ->
            io:format("I TOOK AN ARROW TO THE KNEE ~n", []),
            repl(Enemy);
        _ ->
            io:format("WTF ARE YOU DOING ~n", []),
            repl(Enemy)
    end.
