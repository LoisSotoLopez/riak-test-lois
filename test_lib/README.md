test_lib
=====

Requirements
-----
You will need a Riak cluster running on `127.0.0.1:10017` (or configure your clusters's endpoint on the `src/test_lib.erl` module). 

The configured nodes backend is `leveldb` (to enable 2i).

The problem
-----

This project is a simplification of another one in which some Riak MapReduce operations are performed on a cluster, but for soe reason they fail.

One of that operation's implementation , that will serve as example, is coded under `src/test_lib.erl`. That code has been copied to and successfully tested using an erlang script. But when run as part of a rebar3 lib project like this one it fails.

The script loads some required libraries, all included by [riak-erlang-client](https://github.com/basho/riak-erlang-client) using `code:add_path` (loading those libraries from a local copy of `riak-erlang-client`) and the rebar3 library just sets `riak-erlang-client` as a rebar dependency.

Makefile
-----
Run the MapReduce operation:

    $ make test

With verbose

    $ make vtest
