# frozen_string_literal: true
class ActiveAdminPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.has_role? :admin
  end

  def show?
    user.has_role? :admin
  end

  def create?
    user.has_role? :admin
  end

  def new?
    user.has_role?(:admin) || create?
  end

  def update?
    user.has_role? :admin
  end

  def edit?
    user.has_role?(:admin) || update?
  end

  def destroy?
    user.has_role? :admin
  end

  class Scope < Scope
  end
end
