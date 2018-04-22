class RoundsController < ApplicationController
    def index
        @question = Question.order("RANDOM()").limit(5)
        @answer=Question.new(response_params2)
        respond_to do |format|
          format.js
          format.html {redirect_to home_path }
        end
      end
end
