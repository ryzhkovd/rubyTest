class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :val
      t.integer :page_id

      t.timestamps
    end
  end
end
