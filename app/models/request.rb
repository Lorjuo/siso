class Request < ActiveRecord::Base
  attr_accessible :scope, :state
  has_paper_trail

  state_machine :state, :initial => :pending do
    state :pending
    state :approved
    state :rejected

    event :approve do
      transition :pending => :approved
    end
    
    event :reject do
      transition :pending => :rejected
    end
    
    event :reopen do
      transition [:approved, :rejected] => :pending
    end
    
    event :edit do
      transition :pending => :pending
    end
  end
end
