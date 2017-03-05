class RenameSubscriptionPlansToPlans < ActiveRecord::Migration[5.0]
  def change
    rename_table :subscription_plans, :plans
  end
end
