# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


################################################################################
# Create Users
################################################################################

admins = []
admins << User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)
admins.each do |user|
  user.add_role :admin
end

################################################################################
# End Create Users
################################################################################
# Create SubscriptionPlans
################################################################################

SubscriptionPlan.create!(
  name: 'Free',
  stripe_id: 'free',
  amount: 0,
  interval: 'month'
)

SubscriptionPlan.create!(
  name: 'Standard',
  stripe_id: 'standard',
  amount: 999,
  interval: 'month'
)

SubscriptionPlan.create!(
  name: 'Professional',
  stripe_id: 'professional',
  amount: 2999,
  interval: 'month'
)
