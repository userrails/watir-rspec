class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :action => :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      #redirect_to categories_path
      redirect_to category_path(@category)
    else
      render :action => :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit!
  end
end