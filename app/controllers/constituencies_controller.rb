class ConstituenciesController < ApplicationController
  def index
    @constituencies = Constituency.all
  end

  def show
    @constituency = Constituency.find(params[:id])
  end

  def new
    @constituency = Constituency.new
  end

  def create
    @constituency = Constituency.new(params[:constituency])
    if @constituency.save
      flash[:notice] = "Successfully created constituency."
      redirect_to @constituency
    else
      render :action => 'new'
    end
  end

  def edit
    @constituency = Constituency.find(params[:id])
  end

  def update
    @constituency = Constituency.find(params[:id])
    if @constituency.update_attributes(params[:constituency])
      flash[:notice] = "Successfully updated constituency."
      redirect_to @constituency
    else
      render :action => 'edit'
    end
  end

  def destroy
    @constituency = Constituency.find(params[:id])
    @constituency.destroy
    flash[:notice] = "Successfully destroyed constituency."
    redirect_to constituencies_url
  end
end
