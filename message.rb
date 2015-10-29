require 'pry'

class Message
  attr_reader :message
  Con = (' '..'z').to_a
  def initialize(message)
    @message = message
  end

  def split
    @message = @message.chars
  end

  def assign_to_constant
    message = split
    message_index = message.map do |letter|
      Con.index(letter)
    end
    message_index
  end

  def reverse_on_constant(moding_array)
    encrypt_array = moding_array.map do |num|
      Con.fetch(num)
    end
  end

end
