%%%-------------------------------------------------------------------
%%% @Author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%%
%%% Challenge #19 will use The Adventures of Sherlock Holmes from Project Gutenberg.
%%% Write a program that counts the number of alphanumeric characters there are in The Adventures of Sherlock Holmes. Exclude the Project Gutenberg header and footer, book title, story titles, and chapters. 
%%%Post your code and the alphanumeric character count.
%%%
%%% @end
%%% Created : 22 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('19').

%% API
-export([challenge/0]).
-compile(export_all).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

challenge()->
    File = read_file(),
    {ok,T0} = remove_head(File),
    {ok, T1} = remove_foot(T0,[]),
    get_chars(get_lines(T1)).

%%%===================================================================
%%% Internal functions
%%%===================================================================

read_file()->
    {ok,Binary} = file:read_file("sherlock_holmes.txt"),
    binary:bin_to_list(Binary).

get_lines(Text)->
    lists:flatten(lists:filter(fun(Line)-> case 
                                               re:run(Line, "^(ADVENTURE )?[XIV]+[.]") of
                                               nomatch -> true;
                                               _ -> false
                                           end
                               end, string:tokens(Text, "\n"))).

get_chars(Lines)->
    length(lists:filter(fun(Char) -> case 
                                         re:run(integer_to_list(Char), "[A-Za-z0-9]+") of
                                         nomatch -> false;
                                         _ -> true
                                     end
                        end, Lines)).


remove_head([$T,$o|Rest])->
    {ok,[$T,$o|Rest]};

remove_head([_|Xs])->
    remove_head(Xs);

remove_head([])->
    error.

remove_foot([$E,$n,$d,32,$o,$f,32|_],Rest)->
    {ok,lists:reverse(Rest)};

remove_foot([X|Xs],Acc)->
    remove_foot(Xs, [X|Acc]);

remove_foot([], _)->
    error.

