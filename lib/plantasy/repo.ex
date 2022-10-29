defmodule Plantasy.Repo do
  use Ecto.Repo,
    otp_app: :plantasy,
    adapter: Ecto.Adapters.Postgres
end
