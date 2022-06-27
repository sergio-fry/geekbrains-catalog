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
    admin? || user == record
  end

  def update?
    admin? || user == record
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        scope.where(id: user)
      end
    end
  end
end
