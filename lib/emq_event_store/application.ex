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

defmodule EmqEventStore.Application do
  use Application

  def start(_, _) do
    import Supervisor.Spec, warn: false

    children = [

    ]

    opts = [strategy: :one_for_one, name: EmqEventStore.Supervisor]

    EmqEventStore.load([])

    Supervisor.start_link(children, opts)
  end

  def stop(_) do
    EmqEventStore.unload()
  end
end
