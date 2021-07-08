class AddToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :event, foreign_key: true
  end
end
