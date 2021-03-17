-module(test_lib_SUITE).


%% API
-export([all/0]).

%% EXPORTS
-export([test1/1,test2/1]).

all() -> [test1, test2].

test1(_Config) ->
  {ok, _Results} = test_lib:sample_mr().

test2(_Config) ->
  Out = test_lib:sample_get(),
  ct:print("Out ~p",[Out]).