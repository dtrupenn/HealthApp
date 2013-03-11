class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.float :value
      t.integer :stat_type
      t.integer :user_id

      t.timestamps
    end
  end
end
