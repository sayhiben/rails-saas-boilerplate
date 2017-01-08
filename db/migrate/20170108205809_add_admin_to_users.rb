class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.boolean :admin
    end
  end
end
