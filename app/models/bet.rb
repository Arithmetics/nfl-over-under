class Bet < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :benchmark, presence: true
  has_many :picks, dependent: :destroy


  def toggle_lock
    if locked?
      update_attribute(:locked, false)
    else
      update_attribute(:locked, true)
    end
  end


end
