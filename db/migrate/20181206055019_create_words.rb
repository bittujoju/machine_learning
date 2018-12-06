class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :identifier , :null => false
      t.string :type
      t.timestamps
    end
  end
end
