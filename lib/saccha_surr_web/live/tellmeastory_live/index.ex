defmodule SuchaaSurrWeb.TellmeastoryLive.Index do
  use SuchaaSurrWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :index, _params) do
    socket
    |> assign(page_title: "Tell me a story")
  end

  def apply_action(socket, :read_a_story, _params) do
    socket
    |> assign(page_title: "A Sample story")
  end


end
