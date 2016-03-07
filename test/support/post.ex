defmodule Scrivener.Post do
  use Ecto.Model
  import Ecto.Query

  schema "posts" do
    field :title, :string
    field :body, :string
    field :published, :boolean

    has_many :comments, Scrivener.Comment

    timestamps
  end


  def published(__MODULE__) do
    __MODULE__ |> where([p], p.published == true)
  end
  def published(entries) when is_list(entries) do
    entries |> Enum.filter(&(&1.published == true))
  end


  def unpublished(__MODULE__) do
    __MODULE__ |> where([p], p.published == false)
  end
  def unpublished(entries) when is_list(entries) do
    entries |> Enum.filter(&(&1.published == false))
  end

end
