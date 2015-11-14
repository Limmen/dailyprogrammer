% c('4.erl').
% '4'.start().

-module('4').
-compile(export_all).

start()->
    io:format("Enter length of password"),
    Length = hd(string:tokens(io:get_line("> "),"\r\n")),
password(list_to_integer(Length)).

password(0)->
    [];

password(Length)->
    RandomInt = 33 + random:uniform(127 - 33),
    Res = [RandomInt| password(Length-1)],
    Res;

password() ->
    password(8).
