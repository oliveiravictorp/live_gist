defmodule LiveGist.Repo do
  use Ecto.Repo,
    otp_app: :live_gist,
    adapter: Ecto.Adapters.Postgres
end
