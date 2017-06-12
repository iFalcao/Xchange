class AdminPolicy < ApplicationPolicy
  def new?
      user.full_access?
  end

  def update?
      user.full_access?
  end
  
  def destroy?
      user.full_access?
  end

#Define o escopo através do método resolve
  class Scope < Scope
    def resolve
      if user.full_access?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
