%% Feel free to use, reuse and abuse the code in this file.

-module(stuff_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/2]).

init(_Transport, Req, []) ->
    {ok, Req, undefined}.

handle(Req, State) ->
    {ok, Content} = main_dtl:render([{content, "stuff"}]),
    {ok, Req2} = cowboy_http_req:reply(200, [], Content, Req),
    {ok, Req2, State}.

terminate(_Req, _State) ->
    ok.
