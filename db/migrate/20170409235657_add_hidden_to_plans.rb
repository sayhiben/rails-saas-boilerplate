class AddHiddenToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :hidden, :boolean, default: false
  end
end
