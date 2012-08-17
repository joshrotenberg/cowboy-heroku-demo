%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(hello_world_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
    Dispatch = [
		{'_', [
		       {[<<"stuff">>], stuff_handler, []},
		       {[], default_handler, []}		       
		      ]}
	       ],
    Port = os:getenv("PORT"),
    Port1 = case Port of
	       false -> 8080; 
		_ -> list_to_integer(Port)
	    end,
    {ok, _} = cowboy:start_listener(http, 100,
				    cowboy_tcp_transport, [{port, Port1}],
				    cowboy_http_protocol, [{dispatch, Dispatch}]
				   ),
    hello_world_sup:start_link().

stop(_State) ->
    ok.
