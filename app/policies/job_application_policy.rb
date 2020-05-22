class JobApplicationPolicy < ApplicationPolicy
  def create?
    @user.former_student?
  end
end


