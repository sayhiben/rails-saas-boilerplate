# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SubscriptionsController do
  let(:user) { create(:user) }
  let(:plan) { create(:monthly_plan, name: 'Test Plan', stripe_id: 'pln1') }
  let(:other_plan) { create(:monthly_plan, name: 'Other Plan', stripe_id: 'pln2') }
  let(:subscription) { create(:subscription, plan: plan, owner: user, state: 'active') }

  before do
    Payola.create_stripe_plans = false
    allow(controller).to receive(:current_user) { user }

    # These don't get created in the db unless they're called
    user
    plan
    other_plan
    subscription
  end

  after do
    Payola.create_stripe_plans = true
  end

  describe 'GET#edit' do
    it 'lists all visible plans' do
      get :edit
      expect(assigns(:plans)).to include(plan, other_plan)
    end

    it 'does not list hidden plans' do
      other_plan.update!(hidden: true)
      get :edit
      expect(assigns(:plans)).not_to include(other_plan)
    end

    it 'lists a hidden plan if the user has an active subscription for it' do
      plan.update!(hidden: true)
      get :edit
      expect(assigns(:plans)).to include(plan, other_plan)
    end
  end
end
