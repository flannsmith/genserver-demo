defmodule Server.Database do

use GenServer

def start_link(init_args) do
         GenServer.start_link(__MODULE__, :ok, init_args)
end

@impl true
def init(:ok) do
    {:ok, %{}}
end

def get_state(server) do
    GenServer.call(server, {:get_state, nil})
end
    
def put(server, key, value) do
    GenServer.call(server, {:put, key, value})
end

def delete(server, key) do
    GenServer.call(server, {:delete, key})
end

# Alters the value stored under key to value, but only if the entry key already exists in map.
def replace(server, key, value) do
    GenServer.call(server, {:replace, key, value})
end

def get(server, key) do
    GenServer.call(server, {:get, key})
end

# handle_cast for example purposes

@impl true
def handle_call({:replace, key, value}, _from, state) do
    o = Map.replace!(state, key, value) 
    {:reply, o, o}
    # new_state = Map.replace!(state, key, value)
    # {:reply, new_state, new_state}
end

@impl true
def handle_call({:put, key, value}, _from, state) do
    new_state = Map.put(state, key, value)
    {:reply, new_state, new_state}
end

@impl true
def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
end

@impl true
def handle_call({:get_state, _}, _from, state) do
    {:reply, state, state}
    end



@impl true
def handle_call({:delete, key}, _from, state) do
    new_state = Map.delete(state, key)
    {:reply, new_state, new_state}
end

end


