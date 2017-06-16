PROJECT = emq_event_store
PROJECT_DESCRIPTION = Event Store With MQTT
PROJECT_VERSION = 1.0

PATH := $(CURDIR)/elixir/bin:$(PATH)

app: elixir/lib/elixir/ebin/elixir.app
	mix local.rebar --force
	mix local.hex --force
	mix deps.get
	mix compile
	-rm -rf $(CURDIR)/elixir/lib/mix/test


elixir/lib/elixir/ebin/elixir.app:
	git clone --depth=1 --single-branch --branch v1.4.4 https://github.com/elixir-lang/elixir.git
	echo "start to build elixir ..."
	make -C elixir -f Makefile
