class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :question_id, :user_id, :body, :presence => true

end
