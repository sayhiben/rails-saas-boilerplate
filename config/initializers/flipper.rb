# frozen_string_literal: true
Rails.application.config.flipper = Flipper.new(Flipper::Adapters::ActiveRecord.new)
Flipper.register(:admins) { |user| user.has_role?(:admin) }

class CanAccessFlipperUI
  def self.matches?(request)
    current_user = request.env['warden'].user
    current_user.present? && current_user.has_role?(:admin)
  end
end
