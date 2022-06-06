class UserPolicy < ApplicationPolicy
  def index?
    user.role == "admin"
  end

  def create?
    false
  end

  def new?
    create?
  end

  def show?
    user.role == "admin"
  end

  def update?
    user.role == "admin"
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
