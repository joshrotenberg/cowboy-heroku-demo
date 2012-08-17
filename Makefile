.PHONY: rel deps doc

test: all
	@./rebar skip_deps=true eunit

all: deps
	@./rebar compile

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

doc:
	@./rebar doc skip_deps=true

