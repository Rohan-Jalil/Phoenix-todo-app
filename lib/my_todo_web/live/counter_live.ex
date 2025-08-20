# lib/my_todo_web/live/counter_live.ex
defmodule MyTodoWeb.CounterLive do
  use Phoenix.LiveView

  # Setup initial state
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 0)}
  end

  # Render the UI
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center gap-4 p-6">
      <h1 class="text-2xl font-bold text-gray-800">
        Counter: <%= @count %>
      </h1>
      <div class="flex gap-4">
        <button
          class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-300"
          phx-click="inc">
          +
        </button>
        <button
          class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-red-300"
          phx-click="dec">
          -
        </button>
      </div>
    </div>
    """
  end

  # Handle button clicks
  def handle_event("inc", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("dec", _params, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end
end
