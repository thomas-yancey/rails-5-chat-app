class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.column :user_id, :integer, :null => false
      t.column :room_id, :integer, :null => false

      t.timestamps
    end
  end
end
