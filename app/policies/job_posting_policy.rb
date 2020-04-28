class JobPostingPolicy < ApplicationPolicy
  def new?
    @user.company?
  end

  def create?
    @user.company?
  end

  def show?
    not @user.student?
  end

  def update?
    @user.company?
  end

  def edit?
    update?
  end

  def index?
    not @user.student?
  end
end

