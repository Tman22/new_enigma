require 'minitest'          # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative 'key'      # => true

class Key_Test < Minitest::Test  # => Minitest::Test

  def test_key_splits
    off = Key.new(49382, nil)                    # => #<Key:0x007f99cb87c190 @key=49382, @date=nil>
    off.key                                      # => 49382
    off.key_rand_gen                             # => ["4", "9", "3", "8", "2"]
    off.key                                      # => ["4", "9", "3", "8", "2"]
    assert_equal ['4','9','3','8','2'], off.key  # => true
  end                                            # => :test_key_splits

  def test_assigning_random_key_given_nil
    off = Key.new                          # => #<Key:0x007f99cb86ff80 @key=nil, @date=nil>
    assert_equal 5, off.key_rand_gen.size  # => true
  end                                      # => :test_assigning_random_key_given_nil

  def test_assigning_rand_key_gen
    off = Key.new                                    # => #<Key:0x007f99cb885c40 @key=nil, @date=nil>
    # off.assigning_key                                # => [51, 19, 93, 32]
    # off.key                                          # => [51, 19, 93, 32]
    assert off.key_rand_gen != off.assigning_key     # => true
  end                                                # => :test_assigning_rand_key_gen
  def test_assigning_key
    off = Key.new(40393, nil)                        # => #<Key:0x007f99cb88d5a8 @key=40393, @date=nil>
    off.key                                          # => 40393
    assert_equal [40, 3, 39, 93], off.assigning_key  # => true
  end                                                # => :test_assigning_key

  def test_last_four_of_date_squared_given_date
    off = Key.new(nil ,222215)                                    # => #<Key:0x007f99cb88f2b8 @key=nil, @date=222215>
    off.last_four_of_date_squared                                 # => [6, 2, 2, 5]
    assert_equal [6,2,2,5], off.date                              # => true
  end                                                             # => :test_last_four_of_date_squared_given_date
  def test_if_no_date_given
    off = Key.new                                                 # => #<Key:0x007f99cb87ec88 @key=nil, @date=nil>
    assert_equal Time.now.strftime("%d/%m/%y"), off.date_initial  # => true
  end                                                             # => :test_if_no_date_given

  def test_last_four_of_date_squared_not_given
    off = Key.new                                             # => #<Key:0x007f99cb86f558 @key=nil, @date=nil>
    assert_equal [0, 2, 2, 5], off.last_four_of_date_squared  # => true
  end                                                         # => :test_last_four_of_date_squared_not_given

  def test_add_key_with_date
    off = Key.new(40303 )                                       # => #<Key:0x007f99cb87e0f8 @key=40303, @date=nil>
    # off.add_key_with_date_offsets                               # => [40, 3, 30, 3]
    off.date                                                    # => nil
    off.key                                                     # => 40303
    assert_equal [40, 5, 32, 8], off.add_key_with_date_offsets  # => true
  end                                                           # => :test_add_key_with_date
end                                                             # => :test_add_key_with_date

# >> Run options: --seed 16573
# >>
# >> # Running:
# >>
# >> ........
# >>
# >> Finished in 0.001960s, 4081.5556 runs/s, 4081.5556 assertions/s.
# >>
# >> 8 runs, 8 assertions, 0 failures, 0 errors, 0 skips
