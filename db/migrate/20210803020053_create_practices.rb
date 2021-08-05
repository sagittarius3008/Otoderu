class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|

      t.timestamps
      
      t.integer :orchestra_id, null: false
      t.date :schedule, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.string :place, null: false
      t.text :note, null: false
      t.boolean :stand, null: false, default: false
    end
  end
end
