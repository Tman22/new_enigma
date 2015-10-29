require_relative 'encrypt'
require_relative 'decrypt'
require_relative 'crack'
require 'pry'
class Enigma

  # filename = File.expand_path(ARGV[0], __dir__)
  # message = File.read(filename)

  def encrypt(message, key=nil, date =nil )
    if key.to_s.length == 5 || key == nil
      encrypt = Encrypt.new(message, key, date)
      puts "The key is: #{encrypt.key}"
      encrypt.join_and_return_encryption
    else
     "We only accept code key's with 5 digits"
    end
  end

  def decrypt(message, key=nil, date=nil)
    if key.to_s.length == 5
      decrypt = Decrypt.new(message, key, date)
      decrypt.join_array
    else
      "We must have a key code of 5 digits."
    end
  end

  def crack(message, date=nil)
    crack = Crack.new(message, date)
    crack.assign_back_constant_and_join
  end
end

# if $0 == __FILE__
#   input_file = ARGV[]
