class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :payment_required
      t.integer :price
      t.string :description
      t.integer :max_capacity

      t.timestamps
    end
  end
end
