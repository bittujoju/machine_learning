class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :identifier , :null => false
      t.integer :word_count, :default => 0

      t.timestamps
    end
  end
end