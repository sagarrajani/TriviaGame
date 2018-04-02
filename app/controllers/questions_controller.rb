class QuestionsController < ApplicationController
  respond_to :html, :js

  def index
    # @question = Question.order("RANDOM()").limit(1)
    if params[:tag]
    @question = Question.tagged_with(params[:tag])
    else
    # @question = Question.order("RANDOM()").limit(1)
    @question = Question.all
    # @question=Question.offset(rand(Question.count)).first
    end
    @attempt = Attempt.where(user_id: current_user.id).pluck(:question_id)
    # Person.where(age: 21).pluck(:id)
    # render plain: @attempt
  end

  def myindex
    @question = Question.all
  end

  def new
    @question = Question.new
    # @categories = Category.find(params[:name])
  end

  def show
    @question=Question.find(params[:id])
    @answer=Question.new
  end

  def myshow
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if(@question.update(post_params))
        redirect_to showmyquestion_path(@question)
    else
      render 'edit'
    end
  end


  def create
    # render plain: params[:question].inspect
    # @categories = Category.find(params[:category_id])
    @question = Question.new(post_params)
    @question.user = current_user
    # @question = Question.new(post_params)
    # render plain: params[:question].inspect
    if(@question.save)
        redirect_to myquestion_path
    else
      render 'new'
    end
  end

  def roundindex
    @question = Question.order("RANDOM()").limit(5)
    @answer=Question.new(response_params2)
    respond_to do |format|
      format.js
      format.html {redirect_to home_path }
    end
  end

  def answer
    @question=Question.find(params[:id])
    @answer=Question.new(response_params)
    check = compare(@question, @answer)
    score = 0
    if check
      score = 4
      @question.attempts.create(user_id: current_user.id,question_id: @question.id)
    else
      score = -1
    end
    user = User.find(current_user.id)
    if user.score == nil
      user.update_attribute(:score, score)
      if user.score < 0
        user.update_attribute(:score, 0)
      end
    elsif user.score < 0
      user.update_attribute(:score, 0)
    else
      user.update_attribute(:score, user.score + score)
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

def vote
  value = params[:type] == "up" ? 1 : -1
  @question = Question.find(params[:id])
  @question.add_or_update_evaluation(:votes, value, current_user)
  redirect_back(fallback_location: home_path)
end


  private
    def post_params
      params.require(:question).permit(:question, :answer, :tag_list)
    end
    def compare(question, answer)
      return answer.answer.downcase == question.answer.downcase
    end
    def response_params
      params.require(:question).permit(:question,:answer,:user_id)
    end
    def response_params2
      params.permit(:question,:answer)
    end
end
