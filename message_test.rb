require 'minitest'          # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative 'message'  # => true

class Message_Test < Minitest::Test  # => Minitest::Test

  def test_splits
    m = Message.new("HI world")                              # => #<Message:0x007facfc0a7480 @message="HI world">
    assert_equal ["H","I"," ","w","o","r","l","d"], m.split  # => true
  end                                                        # => :test_splits

  def test_assign_to_constant
    m = Message.new("Hello")                             # => #<Message:0x007facfc0ad880 @message="Hello">
    assert_equal [40,69,76,76,79], m.assign_to_constant  # => true
  end                                                    # => :test_assign_to_constant
end                                                      # => :test_assign_to_constant

# >> Run options: --seed 26826
# >>
# >> # Running:
# >>
# >> ..
# >>
# >> Finished in 0.001434s, 1394.7147 runs/s, 1394.7147 assertions/s.
# >>
# >> 2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
