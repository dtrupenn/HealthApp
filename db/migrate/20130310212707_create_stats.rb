class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.float :value
      t.integer :type
      t.integer :uid

      t.timestamps
    end
  end
end
