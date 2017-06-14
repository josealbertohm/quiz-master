class QuizController < ApplicationController
    def show
    end

    def start
        questions = Question.select("id, content, answer").order("RANDOM()").limit(10)
        session[:questions] = questions
        
        session[:total]   = questions.length
        session[:current] = 0
        session[:correct] = 0
    end

    def letsplay
        @current = session[:current]
        @total   = session[:total]
        @question = session[:questions][@current]
        session[:question] = Question.find(@question['id'])
        render 'quiz/question', :question => @question
    end

    def validate
        @current = session[:current]
        @total   = session[:total]
        
        answer = params[:answer]
        logger.info answer
        
        @question = session[:questions][@current]
        logger.info @question['answer']
        if answer == @question['answer']
            @correct = true
            session[:correct] += 1
        else
            @correct = false
        end
        logger.info @correct
        
        session[:current] += 1
        if iscomplete
            redirect_to :action => "finish"
        else
            @question = session[:questions][@current]
            render 'quiz/question', :question => @question
        end
    end

    def finish       
        @total = session[:total]
        @correct = session[:correct]
        @score = @correct * 100 / @total
        render 'quiz/finish', :score => @score, :total => @total, :correct => @correct
    end

    private
    def iscomplete
        @current = session[:current]
        @total   = session[:total]
        return @current >= @total
    end
end
