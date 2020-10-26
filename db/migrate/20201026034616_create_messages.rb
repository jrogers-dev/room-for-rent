class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references  :sender,     foreign_key: {to_table: :users}, null: false
      t.references  :recipient,  foreign_key: {to_table: :users}, null: false
      t.text :message_content
      t.boolean :read

      t.timestamps
    end
  end
end
