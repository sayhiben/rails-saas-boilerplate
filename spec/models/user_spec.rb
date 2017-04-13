require 'rails_helper'

RSpec.describe User, :vcr do
  let(:user) { create(:user) }
  let(:plan) { create(:monthly_plan, name: 'Test Plan', stripe_id: 'pln1') }
  let(:subscription) { build(:subscription, plan: plan) }

  describe '#stripe_customer_id' do
    context 'when the user has no subscriptions' do
      it 'should return nil' do
        expect(user.stripe_customer_id).to be_nil
      end
    end

    context 'when the user has a subscription' do
      before do
        user.subscriptions << subscription
      end

      it 'should return the user\'s most recent subscription\'s stripe_customer_id' do
        expect(user.stripe_customer_id).to eq(subscription.stripe_customer_id)
      end
    end
  end

  describe '#active_plan' do
    context 'when the user has an active subscription' do
      before do
        subscription.update!(state: 'active')
        user.subscriptions << subscription
      end

      it 'should return the active subscription\'s plan' do
        expect(user.active_plan).to eq(subscription.plan)
      end
    end

    context 'when the user has a canceled subscription' do
      before do
        subscription.update!(state: 'canceled')
        user.subscriptions << subscription
      end

      it 'should return nil' do
        expect(user.active_plan).to be_nil
      end
    end

    context 'when the user has no subscriptions' do
      it 'should return nil' do
        expect(user.active_plan).to be_nil
      end
    end
  end
end
