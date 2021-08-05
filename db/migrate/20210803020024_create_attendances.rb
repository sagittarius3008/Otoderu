class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|

      t.timestamps
      
      t.integer :member_id, null: false
      t.integer :practice_id, null: false
      t.integer :attendance_status, null: false, default: 0
      t.string :note
    end
  end
end
