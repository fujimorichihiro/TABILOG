class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :taggings, :article_id
    add_index :taggings, :tag_id
    add_index :taggings, [:article_id, :tag_id], unique: true
  end
end
