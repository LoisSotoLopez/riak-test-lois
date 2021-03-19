.PHONY: all test vtest

test:
	rebar3 ct

vtest:
	rebar3 ct --verbose