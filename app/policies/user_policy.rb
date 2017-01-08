class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || (user.id == record.id && scope.where(:id => record.id).exists?)
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.admin? || (user.id == record.id)
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || (user.id == record.id)
  end
end
