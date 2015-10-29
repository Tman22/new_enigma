require_relative 'key'
require_relative 'message'

class Decrypt
  attr_reader :message, :offset
  def initialize(message, key, date=nil)
    @message = Message.new(message)
    @offset = Key.new(key, date)
    @message = @message.assign_to_constant
    @offset = @offset.add_key_with_date_offsets

  end

  def subtracting_offset_with_message
    @offset.rotate!(3)
    @message.map do |num|
      @offset.rotate!
      num - @offset[0]
    end
  end

  def moding_array
    subtracting_offset_with_message.map do |num|
      num % 91
    end
  end

  def assigning_back_to_constant
    decrypt = Message.new("Doesn'tMatter")
    decrypt.reverse_on_constant(moding_array)
  end

  def join_array
    assigning_back_to_constant.join
  end

end
