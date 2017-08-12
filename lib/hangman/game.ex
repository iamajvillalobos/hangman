defmodule Hangman.Game do
  @moduledoc false
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters:    [],
  )

  def new_game do
    %Hangman.Game{
      letters: WordDictionary.random |> String.codepoints
    }
  end
end
