class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(resource_params)
    if @resource.save
      name = @resource.name
      redirect_to resources_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create resource. Please try again"
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to resources_path
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update resource_params
    if @resource.save
      flash[:notice] = "Your resource was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def resource_params
      params.require(:resource).permit(:name, :delete)
    end

end
