%%%-------------------------------------------------------------------
%%% @author 13522
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Sep 2022 2:30 PM
%%%-------------------------------------------------------------------
-module(main).
-author("13522").

%% API
-export([client_1/2, client_2/2, client_3/2, client_4/2, client_5/2, client_6/2, client_7/2, client_8/2, server/2, start/2]).

%we have 8 different clients doing different jobs.
%we categorize them simply by the first char after name.
client_1(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_1(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "67890]\;',./{}|:<>?"),
      String = "jiangan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_1(N - 1, Server_PID).

client_2(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_2(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "12345~!@#$%^&*()_+-=["),
      String = "jiangan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_2(N - 1, Server_PID).

client_3(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_3(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "qwertyuiopasdfghjklzxcvbnm"),
      String = "jiangan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_3(N - 1, Server_PID).

client_4(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_4(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "QWERTYUIOPASDFGHJKLZXCVBNM"),
      String = "jiangan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_4(N - 1, Server_PID).

client_5(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_5(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "67890]\;',./{}|:<>?"),
      String = "haolan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_5(N - 1, Server_PID).

client_6(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_6(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "12345~!@#$%^&*()_+-=["),
      String = "haolan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_6(N - 1, Server_PID).

client_7(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_7(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "qwertyuiopasdfghjklzxcvbnm"),
      String = "haolan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_7(N - 1, Server_PID).

client_8(0, Server_PID) ->
  Server_PID ! finished,
  io:format("Client Closed~n");

client_8(N, Server_PID) ->
  Server_PID ! {hello, self()},
  receive
    [startWorking, NumOfZeros, IterationTime] ->
      Char = bitcoin:generateRandomString(1, "QWERTYUIOPASDFGHJKLZXCVBNM"),
      String = "haolan" ++ Char,
      bitcoin:findKeyWithZeros(NumOfZeros, IterationTime, String)
  end,
  client_8(N - 1, Server_PID).

server(NumOfZeros, IterationTime) ->

  receive
    finished ->
      io:format("Server Closed~n", []);
    {hello, Client_PID} ->
      Client_PID ! [startWorking, NumOfZeros, IterationTime],
      server(NumOfZeros, IterationTime)
  end.

start(NumOfZeros, IterationTime) ->
  %here we can change the maximum iteration of the client and server.
  MaxIteration = 10000,
  Server_PID = spawn(main, server, [NumOfZeros, IterationTime]),
  spawn(main, client_1, [MaxIteration, Server_PID]),
  spawn(main, client_2, [MaxIteration, Server_PID]),
  spawn(main, client_3, [MaxIteration, Server_PID]),
  spawn(main, client_4, [MaxIteration, Server_PID]),
  spawn(main, client_5, [MaxIteration, Server_PID]),
  spawn(main, client_6, [MaxIteration, Server_PID]),
  spawn(main, client_7, [MaxIteration, Server_PID]),
  spawn(main, client_8, [MaxIteration, Server_PID]).