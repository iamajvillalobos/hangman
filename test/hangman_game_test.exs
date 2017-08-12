defmodule HangmanGameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns struct" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end
end