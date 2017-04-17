# frozen_string_literal: true
Rails.application.config.flipper = Flipper.new(Flipper::Adapters::ActiveRecord.new)
Flipper.register(:admins) { |user| user.has_role?(:admin) }

# Register each plan and create an example feature for that group
unless ( File.basename($0) == 'rake') # skip when running rake
  Plan.all.each do |plan|
    group_name = "#{plan.name.underscore}_plan_subscribers".to_sym
    Flipper.register(group_name) { |user| user.active_plan == plan }
    Rails.application.config.flipper["#{plan.name.underscore}_example_feature".to_sym].enable_group(group_name)
  end
end

class CanAccessFlipperUI
  def self.matches?(request)
    current_user = request.env['warden'].user
    current_user.present? && current_user.has_role?(:admin)
  end
end
