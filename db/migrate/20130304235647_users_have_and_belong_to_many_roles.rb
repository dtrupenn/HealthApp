class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def up
    create_table :roles_users, :id => false do |t|
      t.references :role, :user
    end
  end

  def down
    create_table :roles_users, :id => false do |t|
      t.references :role, :user
    end
  end
end
