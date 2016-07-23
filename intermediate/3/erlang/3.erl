%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%%
%%% Welcome to cipher day!
%%% Create a program that can take a piece of text and encrypt it with an alphabetical substitution cipher. This can ignore white space, numbers, and symbols.
%%% for extra credit, make it encrypt whitespace, numbers, and symbols!
%%% for extra extra credit, decode someone elses cipher!
%%%
%%% @end
%%% Created : 23 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('3').

%% API
-export([encrypt/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

encrypt(Text)->
    Cipher = create_cipher(),
    lists:foldr(fun(E,A)-> {ok,Value} = maps:find(E,Cipher),
                           [Value|A] end, [], Text).

create_cipher()->
    maps:from_list([{X, random:uniform(57) + 65} || X <- lists:seq(0,127)]).
%%%===================================================================
%%% Internal functions
%%%===================================================================
