%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%% Challenge 36
%%% 1000 Lockers Problem.
%%% In an imaginary high school there exist 1000 lockers labelled 1, 2, ..., 1000. 
%%% All of them are closed. 1000 students are to "toggle" a locker's state. 
%%% * The first student toggles all of them 
%%% * The second one toggles every other one (i.e, 2, 4, 6, ...) 
%%% * The third one toggles the multiples of 3 (3, 6, 9, ...)
%%%  and so on until all students have finished.
%%% To toggle means to close the locker if it is open, and to open it if it's closed.
%%% How many and which lockers are open in the end?
%%%
%%% @end
%%% Created : 23 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('36').

%% Includes
-include_lib("eunit/include/eunit.hrl").

%% API
-export([challenge/0]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Solves the challenge
%% @spec
%% challenge()-> {NumberOfToggledLocks, Toggledlocks}
%% @end
%%--------------------------------------------------------------------
-spec(challenge()-> {integer(), list()}).
challenge()->
    Lockers = lists:foldl(fun(E,A)->  lists:foldr(fun(E2,A2)->
                                                          case E2 rem E of
                                                              0 -> [toggle(lists:nth(E2,A))|A2];
                                                              _ -> [lists:nth(E2,A)|A2]
                                                          end
                                                  end, [], lists:seq(1,1000)) 
                          end, [0 || _ <-lists:seq(1,1000)], lists:seq(1,1000)),
    OpenLockers = get_open(Lockers),
    {length(OpenLockers), OpenLockers}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

toggle(X) when X =:= 0 ->
    1;
toggle(_) ->
    0.

get_open(Lockers)->
    get_open(Lockers,[],1).

get_open([],A,_)->
    lists:reverse(A);
get_open([X|Xs],A,I) when X =:= 1 ->
    get_open(Xs,[I|A],I+1);
get_open([_|Xs],A,I)-> 
    get_open(Xs,A,I+1).


%%%===================================================================
%%% Tests
%%%===================================================================


challenge_test()->
    Toggled = [X*X || X <- lists:seq(1,1000), X*X =< 1000],
    NumberOfToggled = length(Toggled),
    {NumberOfToggled, Toggled} = challenge().
