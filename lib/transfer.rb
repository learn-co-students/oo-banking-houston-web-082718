class Transfer
	attr_accessor :sender, :receiver, :amount
	attr_reader :status, :balance

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = 'pending'
	end

	def valid?
		sender.valid? && receiver.valid?
	end

	def execute_transaction
		 if self.sender.balance > self.amount && @status != 'complete'
			 self.sender.balance -= self.amount
			 self.receiver.balance += self.amount
			 @status = 'complete'
		else
			@status = 'rejected'
			return "Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if @status == 'complete'
			self.receiver.balance -= self.amount
			self.sender.balance += self.amount
			@status = 'reversed'
		end
	end
end
