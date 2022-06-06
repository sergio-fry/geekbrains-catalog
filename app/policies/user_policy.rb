class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def show?
    user.role == "admin" || user == record
  end

  def update?
    user.role == "admin" || user == record
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      if user.role == "admin"
        scope.all
      else
        scope.where(id: user)
      end
    end
  end
end
