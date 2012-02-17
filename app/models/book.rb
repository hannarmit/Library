class Book < ActiveRecord::Base
  
  has_many :reservations
  validates :title, presence: true, uniqueness: true
  validates :authors, presence: true
  
  validates_with IsbnValidator
 def reservation
    self.reservations.where(state: 'reserved').first
  end
end
