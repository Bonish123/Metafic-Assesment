class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :description
      t.string :author_name, null: false
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
