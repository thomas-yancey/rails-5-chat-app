class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.references :user
      t.references :room

      t.timestamps
    end
  end
end
