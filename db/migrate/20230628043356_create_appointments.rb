class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :meet_date
      t.time :meet_time
      t.text :meet_motive
      t.boolean :meet_state
      t.references :medico, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
