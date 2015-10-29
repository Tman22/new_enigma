require_relative 'key'
require_relative 'message'
require 'pry'
class Crack
  attr_reader :message

  def initialize(message, date=nil)
    @date = date
    @message = message
  end

  def find_length
    @message.length
  end

  def mod_length
    find_length % 4
  end

  def assign_array
    assign_array = Message.new(@message)
    new_message = assign_array.assign_to_constant
    new_message
  end
  def find_key
    message = assign_array.last(4)
    last_4array = [0,78,68,14,14]
    message.map do |num|
      last_4array.shift
      num - last_4array[0]
    end
  end

  def rotate_key
    case mod_length
    when 0 then find_key.rotate!(3)
    when 1 then find_key.rotate!(2)
    when 2 then find_key.rotate!
    when 3 then find_key
    end
  end

  def subtract_key
    arr = rotate_key
    assign_array.map do |num|
        arr.rotate!
      num - arr[0]
    end
  end

  def mod_array
    subtract_key.map do |num|
      num % 91
    end
  end

  def assign_back_constant_and_join
    crack = Message.new("doesntmatter")
    code = crack.reverse_on_constant(mod_array)
    code.join
  end
end
