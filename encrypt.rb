require_relative 'key'      # => true
require_relative 'message'  # => true

class Encrypt
  attr_reader :message, :offset, :key # => nil

  def initialize(message, key=nil, date=nil)
    @message = Message.new(message)
    @offset = Key.new(key, date)
    @message = @message.assign_to_constant
    @offset = @offset.add_key_with_date_offsets
    @key = Key.new(key)
    @key = @key.assigning_key.join(" ")
  end                                            # => :initialize

  def add_offset_with_message
    @offset.rotate!(3)
    mod_ready = @message.map do |num|
      @offset.rotate!
      num + @offset[0]
    end
  end                                  # => :add_offset_with_message


  def moding_array
    add_offset_with_message.map do |num|
      num % 91
    end
  end                                     # => :moding_array

  def assign_back_to_constant
    encrypt = Message.new("Doesn'tMatter")
    encrypt.reverse_on_constant(moding_array)
  end                                          # => :assign_back_to_constant

  def join_and_return_encryption
    assign_back_to_constant.join
  end                                   # => :join_and_return_encryption
end                                     # => :join_and_return_encryption
