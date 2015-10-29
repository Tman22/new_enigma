class Message
  attr_reader :message
  Constant = ('a'..'z').to_a + ('0'..'9').to_a + [' ', '.', ',']
  def initalize(message)

  end

  def split
    @message.downcase.split
  end

  def assign_to_constant

  end
end
