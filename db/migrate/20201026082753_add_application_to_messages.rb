class AddApplicationToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :application, :boolean
  end
end
