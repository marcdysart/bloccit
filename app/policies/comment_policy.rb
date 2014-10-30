class CommentPolicy < ApplicationPolicy
  def destroy?
    user.present? && can_moderate?(user, record)
  end

   def index?
     true
   end
end
