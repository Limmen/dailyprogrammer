% c('3.erl').
% '3'.start().


%Alphabetic caesar cipher: left shift with 5.  (Only alphabetic chars: ASCII 65-122)


-module('3').
-compile(export_all).

start()->
    io:format("Enter string to encrypt"),
    String = hd(string:tokens(io:get_line("> "),"\r\n")),
    Encrypted = encrypt(String),
io:format("Encrypted string: ~s ~n",[Encrypted]),
Decrypted = decrypt(Encrypted),
io:format("Decrypted string: ~s ~n",[Decrypted]).
    

encrypt([])->
    [];

encrypt([H|T])->
    case H < 70 of
        true -> [123-(5-(H-65))|encrypt(T)];
        false -> [H-5|encrypt(T)]                  
                 end.

decrypt([])->
    [];

decrypt([H|T])->
    case H > 117 of
        true -> [64+(5-(122-H))|decrypt(T)];
        false -> [H+5|decrypt(T)]                   
                 end.
