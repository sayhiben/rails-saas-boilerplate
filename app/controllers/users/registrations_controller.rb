# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  layout 'account', only: [:edit]
end
