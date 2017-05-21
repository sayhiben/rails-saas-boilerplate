# frozen_string_literal: true

# Monkey patch Payola.secret_key; there are issues with EnvWrapper and the Stripe gem
unless Gem.loaded_specs['payola-payments'].version == Gem::Version.create('1.5.0')
  raise 'Payola gem version changed. Can Payola monkey patches be removed?'
end
module Payola
  class << self
    def secret_key
      @secret_key.to_s
    end
  end
end

Payola.configure do |config|
  # Example subscription:
  #
  # config.subscribe 'payola.package.sale.finished' do |sale|
  #   EmailSender.send_an_email(sale.email)
  # end
  #
  # In addition to any event that Stripe sends, you can subscribe
  # to the following special payola events:
  #
  #  - payola.<sellable class>.sale.finished
  #  - payola.<sellable class>.sale.refunded
  #  - payola.<sellable class>.sale.failed
  #
  # These events consume a Payola::Sale, not a Stripe::Event
  #
  # Example charge verifier:
  #
  # config.charge_verifier = lambda do |sale|
  #   raise "Nope!" if sale.email.includes?('yahoo.com')
  # end

  # Send email
  Payola.configure do |config|
    config.send_email_for :receipt, :refund, :admin_receipt, :admin_dispute, :admin_refund, :admin_failure
  end

  # Prevent a user from having more than one subscription
  config.charge_verifier = lambda do |sub|
    user = User.find_by!(email: sub.email)
    if user.active_subscription.present?
      raise 'You may only have one active subscription at a time. Please contact support.'
    end
  end

  # Keep this subscription unless you want to disable refund handling
  config.subscribe 'charge.refunded' do |event|
    sale = Payola::Sale.find_by(stripe_id: event.data.object.id)
    sale.refund! unless sale.refunded?
  end

  # Associate user with subscription upon subscription creation
  config.subscribe('payola.subscription.active') do |sub|
    user = User.find_by!(email: sub.email)
    sub.owner = user
    sub.save!
  end
end
