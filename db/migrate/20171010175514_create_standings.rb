class CreateStandings < ActiveRecord::Migration[5.1]
  def change
    create_table :standings do |t|
      t.string :team_name
      t.integer :games_played
      t.integer :wins
      t.integer :losses
      t.float :win_loss_pct

      t.timestamps
    end
  end
end
