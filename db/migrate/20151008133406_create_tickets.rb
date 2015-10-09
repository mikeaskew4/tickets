class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :location_id
      t.integer :section
      t.integer :row
      t.integer :seat
      t.string :link
      t.boolean :local
      t.float :asking

      t.timestamps
    end
  end
end
