-module(tecipe_sup).
-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->

    {ok, {{one_for_one, 10, 1},
	  [
	   {tecipe_manager,
	    {tecipe_manager, start_link, []},
	    permanent,
	    3000,
	    supervisor,
	    [tecipe_manager]}
	  ]
	 }}.
