defmodule LiveGistWeb.PageController do
  use LiveGistWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: "/create")
  end
end
