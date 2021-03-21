class CreateTeacherMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_messages do |t|
      t.integer    :physical_condition_id, null: false
      t.integer    :school_lunch_id,       null: false
      t.integer    :defecation_id,         null: false
      t.text       :teacher_comment,      null: false
      t.references :teacher_user,          null: false, foreign_key: true, type: :bigint
      t.references :contact,               null: false, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end