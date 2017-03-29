# frozen_string_literal: true
Rails.application.config.flipper = Flipper.new(Flipper::Adapters::ActiveRecord.new)

Flipper.register(:admins) { |user| user.admin? }
