class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.boolean :completed
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
