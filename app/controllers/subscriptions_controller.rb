# frozen_string_literal: true
class SubscriptionsController < ApplicationController
  # bring in the `render_payola_status` helper.
  include Payola::StatusBehavior

  layout 'account'

  def edit
    @plans = Plan.all
  end
end
