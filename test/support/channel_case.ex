defmodule FamilyFeud.ChannelCase do
  @moduledoc """
  This module defines the test case to be used by
  channel tests.

  Such tests rely on `Phoenix.ChannelTest` and also
  import other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      use Phoenix.ChannelTest

      alias FamilyFeud.Repo
      alias FamilyFeud.User
      alias FamilyFeud.Game
      alias FamilyFeud.Round
      alias FamilyFeud.FastMoneyRound
      alias FamilyFeud.Answer
      alias FamilyFeud.ActiveGame
      alias FamilyFeud.ActiveRound
      alias FamilyFeud.ActiveFastMoneyRound

      import Ecto
      import Ecto.Changeset
      import Ecto.Query


      # The default endpoint for testing
      @endpoint FamilyFeud.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(FamilyFeud.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(FamilyFeud.Repo, {:shared, self()})
    end

    :ok
  end
end
