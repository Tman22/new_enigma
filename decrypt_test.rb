require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'decrypt'

class Decrypt_Test < Minitest::Test

  def test_subtracting_offset_with_message
    d = Decrypt.new("!j:t(", 20394)
    d.message
    d.offset
    assert_equal [-19, 69, -15, -15, -12], d.subtracting_offset_with_message
  end

  def test_moding_decrypt_array
    d = Decrypt.new("!j:t(", 20394)
    assert_equal [72, 69, 76, 76, 79],d.moding_array
  end

  def test_assign_to_constant_again
    d = Decrypt.new("!j:t(", 20394)
    assert_equal ["h","e","l","l","o"], d.assigning_back_to_constant
  end

  def test_join_array
    d = Decrypt.new("!j:t(", 20394)
    assert_equal "hello", d.join_array
  end

  def test_join_again
    d = Decrypt.new(":Gz.KQv.[kf!6k/", 45909)
    assert_equal "hey you ..end..", d.join_array
  end
end
