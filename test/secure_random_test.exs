defmodule SecureRandomTest do
  use ExUnit.Case

  test "base64/1 returns a Binary string" do
    assert is_binary(SecureRandom.base64)
  end

  test "base64/1 defaults to a byte size of 16" do
    #the result of base64 encoding should be 33% larger
    assert 24 == byte_size(SecureRandom.base64)
  end

  test "base64/1 successfully takes a byte_length" do
    assert 4 == byte_size(SecureRandom.base64(3))
  end

  test "hex/1 defaults to a byte size of 16" do
    # The byte size of the resulting string is twice as large
    assert 32 == byte_size(SecureRandom.hex)
  end

  test "hex/1 successfully takes a byte length" do
    assert 12 == byte_size(SecureRandom.hex(6))
  end

  test "urlsafe_base64/1 returns a Binary string" do
    assert is_binary(SecureRandom.urlsafe_base64)
  end

  test "urlsafe_base64/1 defaults to a string length of 22" do
    # length * 33% - 2 bits for the ==
    assert 22 == String.length(SecureRandom.urlsafe_base64)
  end

  test "urlsafe_base64/1 takes a byte_length" do
    assert 6 == String.length(SecureRandom.urlsafe_base64(4))
  end

  test "uuid/0 returns a Binary string" do
    assert is_binary(SecureRandom.uuid)
  end

  test "uuid/0 represents the UUIDv4 standard" do
    # that standard is 128 bit string 4byte-2byte-2byte-2byte-6byte
    assert Regex.match?(~r/\A\w{8}-\w{4}-\w{4}-\w{4}-\w{12}\z/, SecureRandom.uuid)
  end
end
