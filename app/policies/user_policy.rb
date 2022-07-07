class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    admin?
  end

  def new?
    create?
  end

  def show?
    true
  end

  def update?
    admin? || user == record
  end

  def destroy?
    admin?
  end

  def block?
    admin?
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
