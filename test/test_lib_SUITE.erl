-module(test_lib_SUITE).


%% API
-export([all/0]).

%% EXPORTS
-export([test1/1]).

all() -> [test1].

test1(_Config) ->
  {ok, Results} = test_lib:sample_mr().