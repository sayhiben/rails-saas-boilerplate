class AddPayolaIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :payola_subscriptions, [:plan_type, :plan_id]
    add_index :payola_subscriptions, [:owner_type, :owner_id]
  end
end
