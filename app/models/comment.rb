class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :rating, presence: true
  validates :comment, presence: true
  
  
end
