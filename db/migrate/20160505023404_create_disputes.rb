class CreateDisputes < ActiveRecord::Migration
  def change
    create_table :disputes do |t|
      t.string :title
      t.text :situation

      t.timestamps null: false
    end
  end
end
