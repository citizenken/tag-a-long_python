class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :creator
      t.string :description
      t.string :location
      t.string :time
      t.timestamps
    end
  end
end
