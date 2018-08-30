require 'pry'

class Transfer
  # your code here
  attr_reader :receiver, :amount
  attr_accessor :sender, :status
  def initialize(sender, receiver, amount)
   @status = "pending"
   @sender = sender
   @receiver = receiver
   @amount = amount
 end

  def valid?
  sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == 'pending'
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end
