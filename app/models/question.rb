class Question < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :title, :body, :presence => true

end
