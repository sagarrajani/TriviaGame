class QuestionsController < ApplicationController
  def index
    @question = Question.all
    # @categories = params[:name]
  end
  def new
    @question = Question.new
    # @categories = Category.find(params[:name])
  end
  def show
    @categories = Category.find(params[:id])
    @question = Question.find(params[:id])
  end
  def create
    # render plain: params[:question].inspect
    # @categories = Category.find(params[:category_id])
    @question = Question.new(post_params)
    # @question = Question.new(post_params)
    if(@question.save)
        redirect_to home_path
    else
      render 'new'
    end
  end


  private
    def post_params
      params.permit(:question)
    end
end
