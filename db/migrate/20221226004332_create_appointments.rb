class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :doctor
      t.references :patient
      t.text :reccomendation
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
