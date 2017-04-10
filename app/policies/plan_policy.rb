# frozen_string_literal: true
class PlanPolicy < ApplicationPolicy
  def index?
    user.has_role?(:admin)
  end

  def show?
    user.has_role?(:admin)
  end

  def create?
    user.has_role?(:admin)
  end

  def new?
    user.has_role?(:admin)
  end

  def update?
    user.has_role?(:admin)
  end

  def edit?
    user.has_role?(:admin)
  end

  def destroy?
    user.has_role?(:admin)
  end
end
