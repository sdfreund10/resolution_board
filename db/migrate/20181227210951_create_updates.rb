class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.date :date, null: false
      t.decimal :progress, null: false
      t.string :note
      t.references :resolution

      t.timestamps
    end
  end
end
