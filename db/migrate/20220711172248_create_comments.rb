class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :parent_id
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, :parent_id
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
