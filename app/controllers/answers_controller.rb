class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
    if @answer.save
      flash[:notice] = "Your answer has been posted"
      redirect_to user_question_path(current_user, @question)
    else
      flash[:alert] = "Something went wrong. You idiot."
      render :new
    end
  end

  def show
    @answer = current_user.answers.find(params[:id])
    @question = Question.find(params[:question_id])
  end


  private

  def answer_params
    params.require(:answer).permit(:body)
  end


end
