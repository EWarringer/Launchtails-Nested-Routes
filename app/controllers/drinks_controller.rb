class DrinksController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @drink = Drink.new
  end

  def create
    @category = Category.find(params[:category_id])
    @drink = Drink.new(drink_params)
    @drink.category = @category

    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to '/categories/'+params[:category_id]+'/drinks'
    else
      render :new
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @drinks = @category.drinks
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description)
  end
end
