class Reservation < ActiveRecord::Base
 belongs_to :book 
before_validation :make_reserved, on: :create
  STATES = %w( free reserved )
  
  validates :book_id, presence: true
  validates :state, inclusion: { in: STATES }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :book_id, uniqueness: {
          scope: :state,
          message: 'book has been already reserved'
        }, if: "state == 'reserved'"
  private
   def make_reserved
   self.state = 'reserved'
  end
 def free
    self.update_attributes({state: 'free'})
  end
end
