class CreatePoimanages < ActiveRecord::Migration
  def change
    create_table :poimanages do |t|
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
