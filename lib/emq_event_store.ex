##--------------------------------------------------------------------
## Copyright (c) 2016-2017 EMQ Enterprise, Inc. (http://emqtt.io)
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##--------------------------------------------------------------------

defmodule EmqEventStore do
  alias EmqEventStore.{
    Event,
    Repo
  }

  def load(env) do
    register_hook(:"message.publish", &on_message_publish/2, [env])
  end

  def unload do
    deregister_hook(:"message.publish", &on_message_publish/2)
  end

  def on_message_publish(message, _) do
    IO.inspect(["event_store on_message_publish", message])

    message
    |> Poison.decode!() # %{type: String, data: Map, aggregate_id: UUID}
    |> Event.new()
    |> Repo.insert!()

    {:ok, message}
  end

  defp register_hook(topic, callback, args) do
    :emqttd_hooks.add(topic, callback, args)
  end

  defp deregister_hook(topic, callback) do
    :emqttd_hooks.delete(topic, callback)
  end
end
