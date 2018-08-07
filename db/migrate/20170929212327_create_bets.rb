class CreateBets < ActiveRecord::Migration[5.1]
  def change
    create_table :bets do |t|
      t.string :title
      t.float :benchmark
      t.boolean :locked

      t.timestamps
    end
  end
end
