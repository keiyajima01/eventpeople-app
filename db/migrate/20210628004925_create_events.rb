class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, :limit=>32, null:false
      t.integer :type_id, null:false
      t.datetime :date_open, null:false
      t.datetime :date_close, null:false
      t.integer :pref_id, null:false
      t.string :place, :limit=>64, null:false
      t.integer :price
      t.string :price_detail, :limit=>64
      t.integer :needed_skill
      t.string :memo, :limit=>200
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
