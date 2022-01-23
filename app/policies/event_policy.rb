class EventPolicy < ApplicationPolicy
  def show?
    true
  end

  def edit?
    update?
  end

  def create?
    user.present?
  end

  def update?
    user_is_owner?(record)
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def user_is_owner?(event)
    user.present? && (event&.user) == user
  end
end
