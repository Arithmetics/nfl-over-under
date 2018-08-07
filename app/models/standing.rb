class Standing < ApplicationRecord



  def games_left
    82-games_played
  end

  def games_to_cross_goal(goal_pct)
    hypo_wins = wins
    hypo_losses = losses
    hypo_games_played = games_played
    count = 0

    if win_loss_pct < goal_pct
     until hypo_wins.to_f/hypo_games_played.to_f > goal_pct
       hypo_wins += 1
       hypo_games_played += 1
       count += 1
     end
    elsif win_loss_pct > goal_pct
      until hypo_wins.to_f/hypo_games_played.to_f < goal_pct
        hypo_losses += 1
        hypo_games_played += 1
        count += 1
      end
    else
      0
    end
    count
  end



  def required_record(goal_pct, selection)
    remaining_games = 82-self.games_played
    over_win_goal = ((goal_pct + 0.005) * 82 + 1).floor
    under_win_goal = (goal_pct * 82 + 1).floor
    wins_to_get_over = over_win_goal - self.wins
    wins_to_get_under = under_win_goal - self.wins
    if selection == "over"
      if wins_to_get_over <= 0
        result = "Team clinched over"
      elsif wins_to_get_over > remaining_games
        result = "Team clinched under"
      else
        required_more_wins = over_win_goal - self.wins
        max_more_losses = 82 -required_more_wins - self.games_played
        result = "#{required_more_wins} - #{max_more_losses}"
      end
    elsif selection == "under"
      if wins_to_get_under <= 0
        result = "Team clinched over"
      elsif wins_to_get_under > remaining_games
        result = "Team clinched under"
      else
        max_more_wins = under_win_goal - self.wins - 1
        required_more_losses = 82 -max_more_wins - self.games_played
        result = "#{max_more_wins} - #{required_more_losses}"
      end
    end
    result
  end





end
