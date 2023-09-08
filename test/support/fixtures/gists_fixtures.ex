defmodule LiveGist.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveGist.Gists` context.
  """

  @doc """
  Generate a gist.
  """
  def gist_fixture(attrs \\ %{}) do
    {:ok, gist} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        markup_test: "some markup_test"
      })
      |> LiveGist.Gists.create_gist()

    gist
  end

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    {:ok, saved_gist} =
      attrs
      |> Enum.into(%{

      })
      |> LiveGist.Gists.create_saved_gist()

    saved_gist
  end
end
