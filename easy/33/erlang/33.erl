-module('33').

-compile(export_all).


start()->
    List = [
            {"What is the best football team in Sweden? ", "Hammarby"},
            {"What is the capital of Sweden? ","Stockholm"},
            {"What is 2^8? ", "256"}
           ],
    {Question,Answer} = get_question(List),
    io:format("~p",[Question]),
    {ok, [UserAnswer]} = io:fread("","~s"),
    if 
        UserAnswer == Answer ->
            io:format("~ncorrect ~n");
        true ->
            io:format("~nfalse ~n")
    end.

get_question(List)->
    lists:nth((random:uniform(length(List))), List).

