defmodule SecureRandom do
  @moduledoc """
  Takes my favorite hits from Ruby's SecureRandom and brings em to elixir.
  Mostly a convienance wrapper around Erlangs Crypo library, converting 
  Crypto.strong_rand_bytes/1 into a string.

  ## Examples

      iex> SecureRandom.base64
      "xhTcitKZI8YiLGzUNLD+HQ=="

      iex> SecureRandom.urlsafe_base64(4)
      "pLSVJw"

  """
 
  @default_length 16
 
  @doc """
  Returns random Base64 encoded string.

  ## Examples
    
      iex> SecureRandom.base64
      "rm/JfqH8Y+Jd7m5SHTHJoA=="

      iex> SecureRandom.base64(8)
      "2yDtUyQ5Xws="

  """
  def base64(n \\ @default_length) do
    random_bytes(n)
    |> :base64.encode_to_string
    |> to_string
  end
 
  @doc """
  Returns random urlsafe Base64 encoded string.

  ## Examples

      iex> SecureRandom.urlsafe_base64
      "xYQcVfWuq6THMY_ZVmG0mA"

      iex> SecureRandom.urlsafe_base64(8)
      "8cN__l-6wNw"

  """
  def urlsafe_base64(n \\ @default_length) do
    base64(n)
    |> String.replace(~r/[\n\=]/, "")
    |> String.replace(~r/\+/, "-")
    |> String.replace(~r/\//, "_")
  end

  @doc """
  Returns UUID v4 string.

  ## Examples

    iex> SecureRandom.uuid
    "e1d87f6e-fbd5-6801-9528-a1d568c1fd02"
  """
  def uuid do
    bytes = random_bytes |> :erlang.bitstring_to_list
    :io_lib.format("~2.16.0b~2.16.0b~2.16.0b~2.16.0b-~2.16.0b~2.16.0b-~2.16.0b~2.16.0b-~2.16.0b~2.16.0b-~2.16.0b~2.16.0b~2.16.0b~2.16.0b~2.16.0b~2.16.0b", bytes) 
    |> to_string
  end
 
 
  @doc """
  Returns random bytes.
  
  ## Examples

      iex> SecureRandom.random_bytes
      <<202, 104, 227, 197, 25, 7, 132, 73, 92, 186, 242, 13, 170, 115, 135, 7>>

      iex> SecureRandom.random_bytes(8)
      <<231, 123, 252, 174, 156, 112, 15, 29>>

  """
  def random_bytes(n \\ @default_length) do
    :crypto.strong_rand_bytes(n)
  end
end
