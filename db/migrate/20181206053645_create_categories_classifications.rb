class CreateCategoriesClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_classifications do |t|
      t.integer :category_id
      t.integer :classification_id
      t.timestamps
    end
  end
end
