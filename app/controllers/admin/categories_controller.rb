class Admin::CategoriesController < ApplicationController

    before_filter :authorize


  def index
    @categories = Category.order(name: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
