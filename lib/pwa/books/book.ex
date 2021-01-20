defmodule Pwa.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string, required: true
    field :title, :string, required: true

    timestamps()
  end

  @required [:title, :author]

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author])
    |> validate_required(@required)
  end
end
