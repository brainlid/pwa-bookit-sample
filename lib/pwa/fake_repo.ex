defmodule Pwa.FakeRepo do
  alias Pwa.Books.Book
  alias Ecto.Changeset

  def all(Book) do
    [
      %Book{id: "1", title: "Alice in Wonderland", author: "Lewis Carroll"},
      %Book{id: "2", title: "Peter Pan", author: "J. M. Barrie"},
      %Book{id: "3", title: "Cat in the Hat", author: "Dr. Seuss"},
      %Book{id: "4", title: "Don Quixote", author: "Miguel De Cervantes"},
      %Book{id: "5", title: "Pilgrim's Progress", author: "John Bunyan"},
      %Book{id: "6", title: "Robinson Crusoe", author: "Daniel Defoe"},
      %Book{id: "7", title: "Gulliver's Travels", author: "Jonathan Swift"},
      %Book{id: "8", title: "Tom Jones", author: "Henry Fielding"},
      %Book{id: "9", title: "Clarissa", author: "Samuel Richardson"},
      %Book{id: "10", title: "Tristram Shandy", author: "Laurence Sterne"},
      %Book{id: "11", title: "Emma", author: "Jane Austen"},
      %Book{id: "12", title: "Frankenstein", author: "Mary Shelley"},
      %Book{id: "13", title: "Wuthering Heights", author: "Emily Brontë"},
      %Book{id: "14", title: "Little Women", author: "Louisa M. Alcott"}
    ]
  end

  def get!(Book, id) do
    Book
    |> all()
    |> Enum.find(&(&1.id == id))
    |> case do
      nil ->
        raise ArgumentError, "Book not found"

      %Book{} = book ->
        book
    end
  end

  def insert(%Changeset{} = changeset) do
    Changeset.apply_action(changeset, :insert)
  end

  def update(%Changeset{} = changeset) do
    Changeset.apply_action(changeset, :update)
  end

  def delete(%Book{} = book) do
    {:ok, book}
  end
end
