class CreateCategoriesWords < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_words do |t|
      t.integer :category_id
      t.integer :word_id
      t.integer :success_count , :default => 1
      t.integer :failure_count , :default => 1

      t.timestamps
    end
  end
end
