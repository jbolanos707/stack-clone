class QuestionsController < ApplicationController
  def new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Your question has been posted"
      redirect_to user_question_path(current_user, @question)
    else
      flash[:alert] = "Something went wrong. You idiot."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def index
    @questions = Question.all
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end


end
