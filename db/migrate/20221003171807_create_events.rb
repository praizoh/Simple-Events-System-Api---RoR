class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.integer :start_date
      t.integer :end_date
      t.string :time_zone
      t.string :event_link

      t.timestamps
    end
  end
end
