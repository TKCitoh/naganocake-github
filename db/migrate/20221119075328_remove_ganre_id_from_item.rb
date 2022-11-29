class RemoveGanreIdFromItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :ganre_id, :integer
  end
end
