class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null:false
      t.string :last_name, :limit=>32, null:false
      t.string :first_name, :limit=>32, null:false
      t.datetime :birthday, null:false
      t.string :address, :limit=>64, null:false
      t.string :mail, :limit=>256, null:false
      t.string :memo, :limit=>200
      t.integer :status
      t.integer :is_admin
      t.datetime :created_at
      t.datetime :update_at
      t.datetime :deleted_at
    end
  end
end
