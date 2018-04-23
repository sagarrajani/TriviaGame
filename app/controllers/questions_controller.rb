class QuestionsController < ApplicationController
  respond_to :html, :js
  before_action :authenticate_user!
  require 'will_paginate/array'

  def index
    @attempt = Attempt.where(user_id: current_user.id).pluck(:question_id)
    if params[:tag]
    @question = Question.tagged_with(params[:tag])
    else
    @question = Question.order("RANDOM()")
    @question=@question.reject{|o| @attempt.any?{|a| a==o.id} }
    @question=@question.reject{|o| o.user==current_user }
    @question=@question.paginate(:page => params[:page], :per_page => 1)
    end
    @tag="question"
  end

  def show
    @question=Question.find(params[:id])
    @answer=Question.new
  end


  def answer
    @question=Question.find(params[:id])
    @answer=Question.new(response_params)
    check = compare(@question.answer.to_s.downcase, @answer.answer.to_s.downcase)
    score = 0
    if check
      score = 4
      @question.attempts.create(user_id: current_user.id,question_id: @question.id)
    else
      score = -1
    end
    user = User.find(current_user.id)
    if (user.score == nil && score == -1)
      user.update_attribute(:score, 0)
    elsif user.score == nil && score == 4
      user.update_attribute(:score, score)
    else
      user.update_attribute(:score, user.score + score)
      if user.score < 0
        user.update_attribute(:score, 0)
      end
    end
  end


def vote
  value = params[:type] == "up" ? 1 : -1
  @question = Question.find(params[:id])
  @question.add_or_update_evaluation(:votes, value, current_user)
end


  private
    def post_params
      params.require(:question).permit(:question, :answer, :tag_list)
    end
    def compare(question, answer)
      return answer == question
    end
    def response_params
      params.require(:question).permit(:question,:answer,:user_id)
    end
    def response_params2
      params.permit(:question,:answer)
    end
end
