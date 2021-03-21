class CreateParentMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :parent_messages do |t|
      t.integer    :attendance_id,       null: false
      t.integer    :body_temperature_id, null: false
      t.integer    :pick_up_time_id,     null: false
      t.integer    :pick_up_person_id,   null: false
      t.text       :parent_comment,      null: false
      t.references :parent_user,         null: false, foreign_key: true, type: :bigint
      t.references :contact,             null: false, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end