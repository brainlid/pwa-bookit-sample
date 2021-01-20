defmodule PwaWeb.PageLive do
  use PwaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, redirect(socket, to: "/books")}
  end

  @impl true
  def render(assigns) do
    ~L"""
    """
  end
end
