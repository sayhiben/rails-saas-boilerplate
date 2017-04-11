# frozen_string_literal: true
module Payola
  class SubscriptionPolicy < ApplicationPolicy
    def index?
      user.has_role?(:admin)
    end

    def show?
      user.has_role?(:admin)
    end

    def create?
      false
    end

    def new?
      false
    end

    def update?
      false
    end

    def edit?
      false
    end

    def destroy?
      false
    end
  end
end
