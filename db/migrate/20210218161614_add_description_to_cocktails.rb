class AddDescriptionToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :description, :text
  end
end
