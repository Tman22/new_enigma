require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'crack'

class Crack_Test < Minitest::Test

  def test_find_length
    c = Crack.new(":Gz.KQv.[kf!6k/")
    assert_equal 15, c.find_length
  end

  def test_mod_length
    c = Crack.new(":Gz.KQv.[kf!6k/")
    assert_equal 3, c.mod_length
  end

  def test_assign_array
    c = Crack.new("mk/srF/<")
    assert_equal [77,75,15,83,82,38,15,28], c.assign_array
  end

  def test_find_key
    c = Crack.new(":Gz.KQv.[kf!6k/")
    c.find_key
    assert_equal [-77,-46,61,1], c.find_key
  end

  def test_rotate_key
    c = Crack.new(":Gz.KQv.[kf!6k/")
    assert_equal [-77,-46,61,1], c.rotate_key
  end

  def test_rotate_key_mod_1
    c = Crack.new("[oR'$4''x7p'5&95!3o5E")
    assert_equal [-59,11,7,23], c.find_key
    assert_equal [7,23,-59,11], c.rotate_key
  end

  def test_rotate_key_mod_2
    c = Crack.new("[oR'$4''x7p'5&+5E*ykEN")
    assert_equal [11,7,23,32], c.find_key
    assert_equal [7,23,32,11], c.rotate_key
  end

  def test_subtract_key
    c = Crack.new("lGz<2Gor2k")
    assert_equal [72, -22, 89, 14, 14, -22, 78, 68, 14, 14], c.subtract_key
  end

  def test_moding_array
    c = Crack.new("lGz<2Gor2k")
    assert_equal [72, 69, 89, 14, 14, 69, 78, 68, 14, 14], c.mod_array
  end
  
  def test_crack_assign_back_and_join
    c = Crack.new("lGz<2Gor2k")
    assert_equal "hey..end..", c.assign_back_constant_and_join
  end
end
