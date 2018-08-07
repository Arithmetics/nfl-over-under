class AddSelectionToPicks < ActiveRecord::Migration[5.1]
  def change
    add_column :picks, :selection, :string
  end
end
