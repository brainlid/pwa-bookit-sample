defmodule PwaWeb.Components.Modal do
  @moduledoc """
  Modal component that uses route state to toggle it open or closed.

  Heavily inspired by phoenix live generators.
  """
  use PwaWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div id="<%= @id %>"
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target="#<%= @id %>"
      phx-page-loading>

      <div class="fixed z-10 inset-0 overflow-y-auto">
        <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
          <!--
            Background overlay, show/hide based on modal state.
          -->
          <div class="fixed inset-0 transition-opacity">
            <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
          </div>

          <!-- This element is to trick the browser into centering the modal contents. -->
          <span class="hidden sm:inline-block sm:align-middle sm:h-screen"></span>&#8203;

          <%= live_component @socket, @component, @opts %>

        </div>
      </div>
    </div>
    """
  end

  def modal_times_close() do
    ~E"""
    <div class="hidden sm:block absolute top-0 right-0 pt-4 pr-4">
      <button type="button" phx-click="close" phx-target="#modal" class="text-gray-400 hover:text-gray-500 focus:outline-none focus:text-gray-500 transition ease-in-out duration-150" aria-label="Close">
        <!-- Heroicon name: x -->
        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </div>
    """
  end

  def modal_title(title_text) do
    ~E"""
    <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-headline">
      <%= title_text %>
    </h3>
    """
  end

  def modal_instructions_text(text) do
    ~E"""
    <p class="text-sm text-gray-500">
      <%= text %>
    </p>
    """
  end

  def modal_button_tray_close(opts \\ []) do
    close_text = Keyword.get(opts, :close_text, "Close")
    color = Keyword.get(opts, :color, "white")

    color_classes =
      case color do
        "white" ->
          "border-gray-300 bg-white text-gray-700 hover:text-gray-500 focus:ring-blue-500"

        other ->
          "border-transparent bg-#{other}-600 text-white hover:bg-#{other}-700 focus:outline-none"
      end

    ~E"""
    <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
      <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
        <button type="button"
          phx-click="close" phx-target="#modal"
          class="inline-flex justify-center w-full rounded-md border px-4 py-2 <%= color_classes %> text-base leading-6 font-medium shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition ease-in-out duration-150 sm:text-sm sm:leading-5">
          <%= close_text %>
        </button>
      </span>
    </div>
    """
  end

  def modal_button_tray_standard_live(opts \\ []) do
    save_text = Keyword.get(opts, :save_text, "Save")
    saving_text = Keyword.get(opts, :saving_text, "Saving...")
    cancel_text = Keyword.get(opts, :cancel_text, "Cancel")

    ~E"""
    <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
      <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
        <%= submit save_text, phx_disable_with: saving_text,
          class: "inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-indigo-600 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:col-start-2 sm:text-sm" %>
      </span>
      <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
        <button type="button"
          phx-click="close" phx-target="#modal"
          class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base shadow-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:w-auto sm:text-sm">
          <%= cancel_text %>
        </button>
      </span>
    </div>
    """
  end

  def modal_button_tray_destroy_live(opts \\ []) do
    action_text = Keyword.get(opts, :action_text, "Delete")
    acting_text = Keyword.get(opts, :acting_text, "Deleting...")
    cancel_text = Keyword.get(opts, :cancel_text, "Cancel")
    target = Keyword.get(opts, :phx_target, "#modal")

    ~E"""
    <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
      <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
        <button type="button"
          phx-click="destroy-profile" phx-target="<%= target %>" phx-disable-with="<%= acting_text %>"
          class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-red-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-red-500 focus:outline-none focus:border-red-700 focus:ring-red-500 transition ease-in-out duration-150 sm:text-sm sm:leading-5">
          <%= action_text %>
        </button>
      </span>
      <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
        <button type="button"
          phx-click="close" phx-target="#modal"
          class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base font-medium text-gray-700 shadow-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:w-auto sm:text-sm">
          <%= cancel_text %>
        </button>
      </span>
    </div>
    """
  end

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
