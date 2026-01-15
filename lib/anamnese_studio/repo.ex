defmodule AnamneseStudio.Repo do
  use Ecto.Repo,
    otp_app: :anamnese_studio,
    adapter: Ecto.Adapters.Postgres
end
