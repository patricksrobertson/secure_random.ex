defmodule SecureRandom do
  use Bitwise

  @moduledoc """
  Takes my favorite hits from Ruby's SecureRandom and brings em to elixir.
  Mostly a convienance wrapper around Erlangs Crypto library, converting 
  Crypto.strong_rand_bytes/1 into a string.

  ## Examples

      iex> SecureRandom.base64
      "xhTcitKZI8YiLGzUNLD+HQ=="

      iex> SecureRandom.urlsafe_base64(4)
      "pLSVJw"

      iex> SecureRandom.uuid
      "a18e8302-c417-076d-196a-71dfbd5b1e03"

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

  defp bytes_to_int(bytes) do
    case bytes do
      <<x>>             -> x
      <<x, xs::binary>> -> (bytes_to_int(xs) <<< 8) + x
    end
  end

  @doc """
  Generates a random hexadecimal string.

  The argument n specifies the length, in bytes, of the random number to be generated. The length of the resulting hexadecimal string is twice n.

  If n is not specified, 16 is assumed. It may be larger in future.

  The result may contain 0-9 and a-f.

  ## Examples

      iex> SecureRandom.hex(6)
      "34fb5655a231"
  """
  def hex(n \\ @default_length) do
    random_bytes(n)
    |> bytes_to_int
    |> Integer.to_string(16)
    |> String.downcase
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
