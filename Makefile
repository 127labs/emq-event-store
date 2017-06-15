
PATH := $(CURDIR)/elixir/bin:$(PATH)


all: elixir/lib/elixir/ebin/elixir.app
	mix local.rebar --force
	mix local.hex --force
	mix deps.get
	mix compile
	-rm -rf $(CURDIR)/elixir/lib/mix/test


elixir/lib/elixir/ebin/elixir.app:
	git clone https://github.com/elixir-lang/elixir.git
	(cd $(CURDIR)/elixir && git checkout tags/v1.4.4)
	echo "start to build elixir ..."
	make -C elixir -f Makefile
