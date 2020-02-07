defmodule Server.FirstSupervisor do
    use Supervisor
    require Logger

    def start_link(init_arg) do
        Logger.info("Server.FirstSupervisor starting")
        Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
    end

    @impl true
    def init(init_arg) do
        children = [
            {Server.Database}
        ]

        Supervisor.init(children, strategy: :one_for_one)
    end
end
