PROJECT = emq_event_store
PROJECT_DESCRIPTION = Event Store With MQTT
PROJECT_VERSION = 1.0

# NO_AUTOPATCH = cuttlefish

# BUILD_DEPS = emqttd cuttlefish
# dep_emqttd = git https://github.com/emqtt/emqttd master
# dep_cuttlefish = git https://github.com/emqtt/cuttlefish

# ERLC_OPTS += +debug_info
# ERLC_OPTS += +'{parse_transform, lager_transform}'

# TEST_ERLC_OPTS += +debug_info
# TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

# COVER = true

# include erlang.mk

# app.config::
# 	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_event_store.conf -i priv/emq_event_store.schema -d data

PATH := $(CURDIR)/elixir/bin:$(PATH)

app: elixir/lib/elixir/ebin/elixir.app
	mix local.rebar --force
	mix local.hex --force
	mix deps.get
	mix compile
	-rm -rf $(CURDIR)/elixir/lib/mix/test


elixir/lib/elixir/ebin/elixir.app:
	git clone https://github.com/elixir-lang/elixir.git
	(cd elixir && git checkout tags/v1.4.4)
	echo "start to build elixir ..."
	make -C elixir -f Makefile
