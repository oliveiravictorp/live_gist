defmodule LiveGist.Gists.Gist do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "gists" do
    field :name, :string
    field :description, :string
    field :markup_test, :string
    belongs_to :user, LiveGist.Accounts.User
    has_many :comments, LiveGist.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(gist, attrs) do
    gist
    |> cast(attrs, [:name, :description, :markup_test, :user_id])
    |> validate_required([:name, :description, :markup_test, :user_id])
  end
end
