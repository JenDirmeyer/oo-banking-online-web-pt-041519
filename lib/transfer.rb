require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending" 
  end  
  
  def valid?
    sender.valid? == true && receiver.valid? == true && sender.balance > @amount ? true : false
  end  
  
  def execute_transaction
    if @status == "pending" && self.valid? == true
      #binding.pry
      @sender.balance = @sender.balance - amount 
      @receiver.balance = @receiver.balance + amount
      @status = "complete"
    elsif @status == "complete" 
      #binding.pry
      return @status
    else
      binding.pry
      puts "Transaction rejected. Please check your account balance."
      return "rejected"
    end  
  end  
  
  def reverse_transfer
    #binding.pry
    
  end
    
end
