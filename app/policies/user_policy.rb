# frozen_string_literal: true
class UserPolicy < ApplicationPolicy
  def index?
    user.has_role?(:admin)
  end

  def show?
    user.has_role?(:admin) || (user.id == record.id && scope.where(id: record.id).exists?)
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.has_role?(:admin) || (user.id == record.id)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role?(:admin) || (user.id == record.id)
  end
end
