require 'pry'
require_relative './bank_account'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false 
  end

  def execute_transaction
    # binding.pry
    if self.sender.valid? && self.sender.balance > amount && self.status == 'pending'
      self.status = 'complete'
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
      
    end 
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount  
      self.status = 'reversed'
    end
  end 

end
