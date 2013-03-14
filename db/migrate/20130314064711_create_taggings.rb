class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :hash_t
      t.belongs_to :post

      t.timestamps
    end
    add_index :taggings, :hash_t_id
    add_index :taggings, :post_id
  end
end
