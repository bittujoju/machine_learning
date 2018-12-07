class AddNameToClassifications < ActiveRecord::Migration[5.1]
  def change
    add_column :classifications, :name, :string
  end
end
