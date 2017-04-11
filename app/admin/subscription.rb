# frozen_string_literal: true
ActiveAdmin.register Payola::Subscription do
  actions :index, :show

  before_filter only: [:show] do
    @payola_subscription = Payola::Subscription.find_by(guid: params[:id])
  end

  index do
    selectable_column
    id_column
    column :owner
    column :plan
    column :start
    column :error
    column :status
    column :stripe_status
    actions
  end

  filter :owner_id
  filter :plan_id
  filter :status
  filter :stripe_status
end
