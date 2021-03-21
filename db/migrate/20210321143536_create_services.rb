class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.integer    :service_type_id, null: false
      t.integer    :unit_price_id,   null: false
      t.integer    :number_of_times, null: false
      t.text       :teacher_comment, null: false
      t.references :teacher_user,    null: false, foreign_key: true, type: :bigint
      t.references :contact,         null: false, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end