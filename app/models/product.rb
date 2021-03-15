class Product < ApplicationRecord
	validates_presence_of :brand
	validates_presence_of :name
	validates_presence_of :category


	#using aasm to track the state of each project within the collection
	include AASM

	aasm timestamps: true do
    state :unopen, initial: true
    state :open
    state :finished
    state :destashed

    after_all_transitions :log_state_date

    event :open do
      transitions from: :unopen, to: :open
    end

    event :finish do
      transitions from: :open, to: :finished
    end

    event :destash do
      transitions from: [:unopen, :open], to: :destashed
    end
  end

  #set scopes for common sorts and subsets of products
  scope :current, -> { where(aasm_state: ['unopen', 'open'])}
  scope :gone, -> { where(aasm_state: ['finished', 'destashed'])}

  def fullname
  	[self.brand, self.name].join(' ')
  end

  private

  	#setting the date the state changed which is logged
	  def log_state_date
	    self.aasm_state_date = Date.today
	    self.save
	  end
end