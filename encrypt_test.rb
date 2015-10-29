require 'minitest'          # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative 'encrypt'  # => true

class Encrypt_Test < Minitest::Test  # => Minitest::Test

  def test_message_works

  end  # => :test_message_works

  def test_key_and_date_come

  end  # => :test_key_and_date_come

  def test_adding_offset_with_key
    e = Encrypt.new("Hello", 20394)                             # => #<Encrypt:0x007f9cba857010 @message=[40, 69, 76, 76, 79], @offset=[20, 5, 41, 99], @key=20394>
    e.message                                                   # => [40, 69, 76, 76, 79]
    e.offset                                                    # => [20, 5, 41, 99]
    assert_equal [60,74,117,175,99], e.add_offset_with_message  # => true
  end                                                           # => :test_adding_offset_with_key

  def test_moding_array
    e = Encrypt.new("hello", 20394)              # => #<Encrypt:0x007f9cba85c6c8 @message=[72, 69, 76, 76, 79], @offset=[20, 5, 41, 99], @key=20394>
    assert_equal [1,74,26,84,8], e.moding_array  # => true
  end                                            # => :test_moding_array

  def test_assign_back_to_constant
    e = Encrypt.new("hello", 20394)                                # => #<Encrypt:0x007f9cba865e08 @message=[72, 69, 76, 76, 79], @offset=[20, 5, 41, 99], @key=20394>
    assert_equal ["!","j",":","t","("], e.assign_back_to_constant  # => true
  end                                                              # => :test_assign_back_to_constant

  def test_join_and_return_encryption
    e = Encrypt.new("hello", 20394)                     # => #<Encrypt:0x007f9cbb0028f0 @message=[72, 69, 76, 76, 79], @offset=[20, 5, 41, 99], @key=20394>
    assert_equal "!j:t(", e.join_and_return_encryption  # => true
  end                                                   # => :test_join_and_return_encryption

  def test_random_encryption
    e = Encrypt.new("woot!!")            # => #<Encrypt:0x007f9cba85f1c0 @message=[87, 79, 79, 84, 1, 1], @offset=[57, 78, 69, 81], @key=nil>
    e.moding_array                       # => [53, 66, 57, 74, 58, 79]
    assert e.join_and_return_encryption  # => true
  end                                    # => :test_random_encryption



end  # => :test_random_encryption

# >> Run options: --seed 42509
# >>
# >> # Running:
# >>
# >> .......
# >>
# >> Finished in 0.001768s, 3958.6155 runs/s, 2827.5825 assertions/s.
# >>
# >> 7 runs, 5 assertions, 0 failures, 0 errors, 0 skips
