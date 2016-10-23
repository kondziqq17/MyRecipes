class Comment < ActiveRecord::Base
  validates :body, presence: true, length: { minimum: 5, maximum: 100 }
  belongs_to :chef
  belongs_to :recipe
end
