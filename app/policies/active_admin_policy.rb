class ActiveAdminPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin?
  end

  def show?
    @user.admin? 
  end

  def create?
    @user.admin?
  end

  def new?
    @user.admin? && create?
  end

  def update?
    @user.admin?
  end

  def edit?
    @user.admin? && update?
  end

  def destroy?
    @user.admin?
  end

  class Scope < Scope
  end
end
