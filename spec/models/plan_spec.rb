require 'rails_helper'

RSpec.describe Plan, :vcr do
  let(:plan) { build(:monthly_plan, name: 'Test Plan', stripe_id: 'pln1') }

  describe '#formatted_amount' do
    it 'should format 0 correctly in USD' do
      plan.amount = 0
      plan.save!

      expect(plan.formatted_amount).to eq('$0.00')
    end

    it 'should format positive values correctly in USD' do
      plan.amount = 100_000
      plan.save!

      expect(plan.formatted_amount).to eq('$1,000.00')
    end
  end
end
