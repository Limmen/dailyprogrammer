%%%-------------------------------------------------------------------
%%% @author kim <kim@limmen>
%%% @copyright (C) 2016, kim
%%% @doc
%%%
%%%Challenge #19 will use The Adventures of Sherlock Holmes from Project Gutenberg.
%%%Write a program that counts the number of alphanumeric characters there are in The Adventures of Sherlock Holmes. Exclude the Project Gutenberg header and footer, book title, story titles, and chapters. 
%%%Post your code and the alphanumeric character count.
%%%
%%% @end
%%% Created : 22 Jul 2016 by kim <kim@limmen>
%%%-------------------------------------------------------------------
-module('19').

%% API
-export([]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

challenge()->
    ok.

read_file()->
    {ok,Binary} = file:read_file("sherlock_holmes.txt"),
    binary:bin_to_list(Binary).

filter_text(Text)->
    Chapters = [
                "II.",
                "IV. The Boscombe Valley Mystery",
                "V. The Five Orange Pips",
                "VI. The Man with the Twisted Lip",
                "IX. The Adventure of the Engineer's Thumb",
                "X. The Adventure of the Noble Bachelor",
                "XI. The Adventure of the Beryl Coronet"],
    lists:filter(fun(Line)-> ok end, Text).



%%%===================================================================
%%% Internal functions
%%%===================================================================
