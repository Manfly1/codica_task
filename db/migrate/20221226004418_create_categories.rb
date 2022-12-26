class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, index: true, unique: true
      t.references :doctor
    end
  end
end
