-module(test_lib).

-define(BUCKET, <<"Cars">>).

-export([sample_mr/0]).

sample_mr() ->
  {ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 10017),

  MapFun = fun(O, _, _) ->
    [{count,1}]
  end,

  RedFun = fun(O, none) ->
    [lists:foldl(
      fun(G, Acc) ->
        {count, N} = G,
        {count, Acc2} = Acc,
        {count, N + Acc2}
      end,
      {count, 0},
      O)]
  end,

  Phases = [
    {map, {qfun, MapFun}, [], true},
    {reduce, {qfun, RedFun}, none, true}
  ],

  Out = riakc_pb_socket:mapred_bucket(Pid, ?BUCKET, Phases),
  riakc_pb_socket:stop(Pid),
  Out.

