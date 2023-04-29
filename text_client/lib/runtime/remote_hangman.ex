defmodule TextClient.Runtime.RemoteHangman do
  @remote_server :hangman@62b33b6b12e6
  def connect() do
    :rpc.call(@remote_server, Hangman, :new_game, [])
  end
end
