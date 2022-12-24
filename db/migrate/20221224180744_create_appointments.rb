class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.boolean :closed, default: false
      t.string :recommendation
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
