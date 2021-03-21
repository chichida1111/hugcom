class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer    :group_id,           null: false
      t.string     :last_name_c_j,      null: false
      t.string     :first_name_c_j,     null: false
      t.string     :last_name_c_k,      null: false
      t.string     :first_name_c_k,     null: false
      t.references :parent_user,        null: false, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end