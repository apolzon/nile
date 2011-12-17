class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.string :state
      t.string :owner
      t.string :developer
      t.string :qa

      t.timestamps
    end
  end
end
