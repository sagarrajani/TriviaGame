class TagsController < ApplicationController
  
  def index
    @tags=ActsAsTaggableOn::Tag.all
  end

  def question
    @question = Question.tagged_with(params[:tag])
    @attempt = Attempt.where(user_id: current_user.id).pluck(:question_id)
    @question=@question.reject{|o| @attempt.any?{|a| a==o.id} }
    @question=@question.reject{|o| o.user==current_user }
    @question = @question.paginate(:page => params[:page], :per_page => 5)
    @tag=params[:tag]
    # @tagw="tag"
  end
  
  def show
    @question=Question.find(params[:id])
    @answer=Question.new
  end

  def answer
    @tag=params[:name]
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
