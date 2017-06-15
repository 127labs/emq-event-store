@moduledoc """
A schema is a keyword list which represents how to map, transform, and validate
configuration values parsed from the .conf file. The following is an explanation of
each key in the schema definition in order of appearance, and how to use them.

## Import

A list of application names (as atoms), which represent apps to load modules from
which you can then reference in your schema definition. This is how you import your
own custom Validator/Transform modules, or general utility modules for use in
validator/transform functions in the schema. For example, if you have an application
`:foo` which contains a custom Transform module, you would add it to your schema like so:

`[ import: [:foo], ..., transforms: ["myapp.some.setting": MyApp.SomeTransform]]`

## Extends

A list of application names (as atoms), which contain schemas that you want to extend
with this schema. By extending a schema, you effectively re-use definitions in the
extended schema. You may also override definitions from the extended schema by redefining them
in the extending schema. You use `:extends` like so:

`[ extends: [:foo], ... ]`

## Mappings

Mappings define how to interpret settings in the .conf when they are translated to
runtime configuration. They also define how the .conf will be generated, things like
documention, @see references, example values, etc.

See the moduledoc for `Conform.Schema.Mapping` for more details.

## Transforms

Transforms are custom functions which are executed to build the value which will be
stored at the path defined by the key. Transforms have access to the current config
state via the `Conform.Conf` module, and can use that to build complex configuration
from a combination of other config values.

See the moduledoc for `Conform.Schema.Transform` for more details and examples.

## Validators

Validators are simple functions which take two arguments, the value to be validated,
and arguments provided to the validator (used only by custom validators). A validator
checks the value, and returns `:ok` if it is valid, `{:warn, message}` if it is valid,
but should be brought to the users attention, or `{:error, message}` if it is invalid.

See the moduledoc for `Conform.Schema.Validator` for more details and examples.
"""
[
  extends: [],
  import: [],
  mappings: [
    "emq_event_store.Elixir.EmqEventStore.Repo.adapter": [
      commented: false,
      datatype: :atom,
      default: Ecto.Adapters.Postgres,
      doc: "Provide documentation for emq_event_store.Elixir.EmqEventStore.Repo.adapter here.",
      hidden: false,
      to: "emq_event_store.Elixir.EmqEventStore.Repo.adapter"
    ],
    "emq_event_store.Elixir.EmqEventStore.Repo.database": [
      commented: false,
      datatype: :binary,
      default: "emq_event_store_dev",
      doc: "Provide documentation for emq_event_store.Elixir.EmqEventStore.Repo.database here.",
      hidden: false,
      to: "emq_event_store.Elixir.EmqEventStore.Repo.database",
      env_var: "EMQ_EVENT_STORE_DATABASE"
    ],
    "emq_event_store.Elixir.EmqEventStore.Repo.username": [
      commented: false,
      datatype: :binary,
      default: "postgres",
      doc: "Provide documentation for emq_event_store.Elixir.EmqEventStore.Repo.username here.",
      hidden: false,
      to: "emq_event_store.Elixir.EmqEventStore.Repo.username",
      env_var: "EMQ_EVENT_STORE_USERNAME"
    ],
    "emq_event_store.Elixir.EmqEventStore.Repo.password": [
      commented: false,
      datatype: :binary,
      default: "postgres",
      doc: "Provide documentation for emq_event_store.Elixir.EmqEventStore.Repo.password here.",
      hidden: false,
      to: "emq_event_store.Elixir.EmqEventStore.Repo.password",
      env_var: "EMQ_EVENT_STORE_PASSWORD"
    ],
    "emq_event_store.Elixir.EmqEventStore.Repo.hostname": [
      commented: false,
      datatype: :binary,
      default: "localhost",
      doc: "Provide documentation for emq_event_store.Elixir.EmqEventStore.Repo.hostname here.",
      hidden: false,
      to: "emq_event_store.Elixir.EmqEventStore.Repo.hostname",
      env_var: "EMQ_EVENT_STORE_HOSTNAME"
    ],
    "emq_event_store.Elixir.EmqEventStore.Repo.port": [
      commented: false,
      datatype: :integer,
      default: 5432,
      doc: "Provide documentation for emq_event_store.Elixir.EmqEventStore.Repo.port here.",
      hidden: false,
      to: "emq_event_store.Elixir.EmqEventStore.Repo.port",
      env_var: "EMQ_EVENT_STORE_PORT"
    ],
    "emq_event_store.ecto_repos": [
      commented: false,
      datatype: [
        list: :atom
      ],
      default: [
        EmqEventStore.Repo
      ],
      doc: "Provide documentation for emq_event_store.ecto_repos here.",
      hidden: false,
      to: "emq_event_store.ecto_repos"
    ]
  ],
  transforms: [],
  validators: []
]
