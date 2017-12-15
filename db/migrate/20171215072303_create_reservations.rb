class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.datetime :requested_datetime
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
