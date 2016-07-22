%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%%
%%% @end
%%% Created : 22 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('1_menu').

%% API
-export([init/0]).

%% Records
-record(event, {name :: atom(), hour :: integer()}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

init()->
    repl([]).

%%%===================================================================
%%% Internal functions
%%%===================================================================

repl(State)->
    Input = string:tokens(lists:nth(1,string:tokens(io:get_line("> "),"\n")), " "),
    case list_to_atom(string:to_lower(lists:nth(1, Input))) of 
        add ->
            repl(add(list_to_atom(string:to_lower(lists:nth(2, Input))), list_to_integer(lists:nth(3, Input)), State));
        delete ->
            repl(delete(list_to_atom(string:to_lower(lists:nth(2, Input))), State));
        list ->
            list(State),
            repl(State);
        help ->
            help(),
            repl(State);
        _ ->
            error(),
            repl(State)
    end.



-spec(add(atom(), integer(), list())-> list()).
add(EventName, Hour, State)->
    io:format("~p added ~n", [EventName]),
    Event = #event{name=EventName, hour=Hour},
    [Event|State].

-spec(delete(atom(), list())-> list()).
delete(EventName, State)->
    io:format("~p deleted ~n", [EventName]),
    lists:filter(fun(Event) -> not Event#event.name =:= EventName end, State).

list(State)->
    lists:map(fun(#event{name=Name, hour=Hour}) -> io:format("~p ~p ~n", [Name, Hour]) end, State).

help()->
    io:format("The following commands are available: \n add <eventname> <hour(integer)> \n delete <eventname> \n list \n edit <eventname> <hour(integer)> \n", []).

error()->
    io:format("Invalid command, type help to see a list of available commands \n", []).
