class MyquestionsController < ApplicationController
  require 'will_paginate/array'

    def index
        @question = Question.all
        @question=@question.reject{|o| o.user!=current_user }
        @question = @question.paginate(:page => params[:page], :per_page => 5)
    end

    def show
      @question = Question.find(params[:id])
    end

    def edit
      @question = Question.find(params[:id])
    end

    def destroy
      @question=Question.find(params[:id])
      @question.destroy
      redirect_to myquestions_path
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(post_params)
        @question.user = current_user
        if(@question.save)
            redirect_to myquestions_path
        else
          render 'new'
        end
    end

    def update
    @question = Question.find(params[:id])
    if(@question.update(post_params))
        redirect_to myquestion_path(@question)
    else
        render 'edit'
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
