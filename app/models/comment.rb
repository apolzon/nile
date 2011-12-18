class Comment < ActiveRecord::Base
  validates :author, presence: true
  validates :body, presence: true
end
