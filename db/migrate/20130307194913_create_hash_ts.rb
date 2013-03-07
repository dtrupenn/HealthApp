class CreateHashTs < ActiveRecord::Migration
  def change
    create_table :hash_ts do |t|
      t.string :tag
      t.integer :post_id

      t.timestamps
    end
  end
end
