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

  test "state hasn't changed for :won or :lost game" do
    for state <- [ :won, :lost ] do
      game = Game.new_game
            |> Map.put(:game_state, state)

      assert { ^game, _ } = Game.make_move(game, "x")
    end
  end

  test "first occurence of letter is not already used" do
    game = Game.new_game
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state != :already_used    
  end

  test "second occurence of letter is already used" do
    game = Game.new_game
    { game, _tally } = Game.make_move(game, "x")
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end
end