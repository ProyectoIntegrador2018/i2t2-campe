class GroupsController < ApplicationController
  def new 
    @group = Group.new 
  end

  def index 
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def create
    @group = Group.new(group_params)
    @group.name = @group.name.parameterize(separator: '_')
    if Group.exists?(name: @group.name)
      flash.now[:error] = "Hubo un error con el registro, verifica los campos del formulario"
      render :new
    else
      @group.save
      redirect_to groups_path
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end