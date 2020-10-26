class AddPropertyIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :property_id, :integer
  end
end
