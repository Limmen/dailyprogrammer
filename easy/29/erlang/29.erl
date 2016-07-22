-module('29').

-export([start/1]).

start(Word)->
    is_palindrome(Word).


is_palindrome(Word) ->
    Word == lists:reverse(Word).
