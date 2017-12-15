class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.time "start_time"
      t.time "end_time"

      t.timestamps
    end
  end
end
