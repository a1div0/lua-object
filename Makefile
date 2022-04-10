SHELL := /bin/bash

.PHONY: clean test

install: clean
	tarantoolctl rocks install luacheck && \
	tarantoolctl rocks install luacov 0.13.0 && \
	tarantoolctl rocks install luacov-reporters 0.1.0 && \
	tarantoolctl rocks install luatest && \
	tarantoolctl rocks install https://raw.githubusercontent.com/a1div0/ide-debug/main/ide-debug-1.0.0-1.rockspec

clean:
	rm -rf ./.rocks

test:
	./.rocks/bin/luacheck object/ test/ && \
	./.rocks/bin/luatest -c --coverage ./test/unit_test.lua unit.prototype_and_inheritance unit.is_instance && \
    ./.rocks/bin/luacov -r summary && cat luacov.report.out