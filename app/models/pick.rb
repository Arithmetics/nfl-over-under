class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :bet
  #default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :bet_id, presence: true



  def toggle_lock
    if locked?
      update_attribute(:locked, false)
    else
      update_attribute(:locked, true)
    end
  end


  def projected_win?
      win = true
      standing_status = Standing.where(team_name: self.title).last.win_loss_pct
      standing_goal = Standing.where(team_name: "#{self.title} Goal").last.win_loss_pct
      if standing_status
        if self.selection == "over"
          if standing_status > standing_goal && self.super
            win = true
          elsif standing_status > standing_goal
            win = true
          else
            win = false
          end
        elsif self.selection == "under"
          if standing_status < standing_goal && self.super
            win = true
          elsif standing_status < standing_goal
            win = true
          else
            win = false
          end
        end
      end
      win
    end



end
