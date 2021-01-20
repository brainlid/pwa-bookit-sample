defmodule PwaWeb.Components do
  @moduledoc """
  Defines a set of web components for use in LiveView templates.
  """
  import Phoenix.LiveView.Helpers

  @doc """
  Render the "X" corner close button for a modal.

  Composable portion of a modal.
  """
  defdelegate modal_times_close(), to: PwaWeb.Components.Modal, as: :modal_times_close

  @doc """
  Render the markup for displaying a modal title.
  """
  defdelegate modal_title(title_text), to: PwaWeb.Components.Modal

  @doc """
  Render the markup for displaying a modal's instruction text.
  """
  defdelegate modal_instructions_text(text), to: PwaWeb.Components.Modal

  @doc """
  Renders a component inside the `PwaWeb.Components.Modal` component.

  This modal needs to be routed to, rather than toggled on/off as we have
  normally done in the past.

  The rendered modal receives a `:return_to` option to properly update the URL
  when the modal is closed.

  All other options are passed directly into the rendered component.

  ## Examples

      <%= modal @socket, SomeComponent,
        id: @product.id || :new,
        action: @live_action,
        product: @product,
        return_to: Routes.some_path(@socket, :index) %>

  In this example, `product` is being passed into `SomeComponent`.

  ## Configuration

  The following options can be passed:

    - `:title`: sets the title of the modal
    - `:return_to`: used to redirect when the modal is closed

  """
  def modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    title = Keyword.get(opts, :title, nil)

    modal_opts = [
      id: :modal,
      return_to: path,
      component: component,
      title: title,
      opts: opts
    ]

    live_component(socket, PwaWeb.Components.Modal, modal_opts)
  end
end
