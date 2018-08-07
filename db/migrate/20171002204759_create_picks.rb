class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.string :title
      t.float :benchmark
      t.boolean :locked
      t.boolean :super
      t.references :user, foreign_key: true
      t.references :bet, foreign_key: true

      t.timestamps
    end
    
  end
end
