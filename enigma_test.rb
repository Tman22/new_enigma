require 'minitest'          # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative 'enigma'   # => true

class Enigma_Test < Minitest::Test  # => Minitest::Test

  def test_encrypt
    e = Enigma.new                               # => #<Enigma:0x007fce0127ddd8>
    assert_equal "yJQ", e.encrypt("HEy", 49494)  # => true
  end                                            # => :test_encrypt

  def test_encrypt_key_edge
    e = Enigma.new                                                                   # => #<Enigma:0x007fce0127d018>
    assert_equal "We only accept code key's with 5 digits", e.encrypt("to", 484848)  # => true
    assert_equal "We only accept code key's with 5 digits", e.encrypt("to", 49)      # => true
    assert_equal "EF", e.encrypt("to", "44844")                                      # => true
  end                                                                                # => :test_encrypt_key_edge

  def test_decrypt
    e = Enigma.new                               # => #<Enigma:0x007fce0135e6a8>
    assert_equal "HEy", e.decrypt("yJQ", 49494)  # => true
  end                                            # => :test_decrypt

  def test_decrypt_key_edge
    e = Enigma.new                                                                # => #<Enigma:0x007fce0135d230>
    assert_equal "We must have a key code of 5 digits.", e.decrypt("to", 484848)  # => true
    assert_equal "We must have a key code of 5 digits.", e.decrypt("to", 49)      # => true
  end                                                                             # => :test_decrypt_key_edge

  def test_crack
     e = Enigma.new                                    # => #<Enigma:0x007fce0127ec10>
     assert_equal "hey..end..", e.crack("lGz<2Gor2k")  # => true
  end                                                  # => :test_crack
end                                                    # => :test_crack

# >> Run options: --seed 58248
# >>
# >> # Running:
# >>
# >> .The key is: 49 94 49 94
# >> .The key is: 44 48 84 44
# >> ...
# >>
# >> Finished in 0.002457s, 2035.0020 runs/s, 3256.0033 assertions/s.
# >>
# >> 5 runs, 8 assertions, 0 failures, 0 errors, 0 skips
