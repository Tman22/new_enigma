require 'pry'
class Key
  attr_accessor :key, :date

  def initialize( key = nil, date = nil)
    @key = key
    @date = date
  end
  def date_initial
    if @date
      @date
    else
      @date = Time.now.strftime("%d/%m/%y")
    end
  end

  def key_rand_gen
    if @key
     @key = @key.to_s.split('')
   else
      @key = rand(10000..99999).to_s.chars
    end
  end

  def assigning_key
    key_rand_gen
    current = []
    new_array = []
    @key.each do |x|
      current << x
      # binding.pry
    end
    @key.pop
    @key = @key.map do |x|
      current.shift
      (x + current[0]).to_i
    end
  end

  def last_four_of_date_squared
    @date = date_initial
    date = @date.to_s.split('/').join
    date_squared = (date.to_i)**2
    @date = date_squared.to_s.chars.last(4)
    @date = @date.map do |num|
      num.to_i
    end
  end

  def add_key_with_date_offsets
    last_four_of_date_squared
    assigning_key
    array = []
    @key.each_with_index do |num, index|
    array << @key[index] + @date[index]
    end
    array
  end
end
