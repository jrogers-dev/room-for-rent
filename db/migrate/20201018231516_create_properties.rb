class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references  :landlord, foreign_key: {to_table: :users}, null: false
      t.references  :tenant,   foreign_key: {to_table: :users}
      t.string      :address,                                   null: false
      t.integer     :rooms,                                     null: false
      t.integer     :bathrooms,                                 null: false
      t.integer     :squarefeet,                                null: false
      t.integer     :storeys,                                   null: false
      t.integer     :rent,                                      null: false
      t.text        :description
      t.boolean     :available,                                 null: false

      t.timestamps
    end
  end
end
