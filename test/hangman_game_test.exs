defmodule HangmanGameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns struct" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "new_game returns lowercase letters to guess" do
    game = Game.new_game

    result = game.letters
              |> Enum.map(&(String.downcase(&1) == &1))
              |> Enum.all?(fn(_x) -> true end)

    assert result == true
  end
end