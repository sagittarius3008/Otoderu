class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.integer :member_id, null: false
      t.integer :orchestra_id, null: false

      t.timestamps
    end
  end
end
