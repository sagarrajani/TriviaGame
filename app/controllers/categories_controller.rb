class CategoriesController < ApplicationController
    # before_action :authenticate_user!
  def index
    @categories = Category.all.pluck(:id)
    @categorie = Category.all.pluck(:name)
      # @categories = Category.find(params[:id])
  end
  def new
    @categories = Category.new
  end
  def show
    @categories = Category.find(params[:id])
  end
  def create
    # render plain: params[:category].inspect
    # @category = category(params)
    @categories = Category.new(post_params)
    #
    if(@categories.save)
      # redirect_to @categories
        redirect_to new_questions_path(@categories)
    else
      render 'new'
    end
  end
  private
  def post_params
      params.require(:category).permit(:id,:name)
    end
    # def category(params)
    #   @category ||= Category.find_by_name(params[:category])
    # end
end
