module BetsHelper



  def lock_bet
    update_attribute(:locked, true)
  end

  def unlock_bet
    update_attribute(:locked, false)
  end
end
