class CreateMedicos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicos do |t|
      t.string :name
      t.string :specialty

      t.timestamps
    end
  end
end
