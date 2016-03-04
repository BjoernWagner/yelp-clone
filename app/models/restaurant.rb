class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true

  def build_review(params, user)
    Review.create(rating: params[:rating], thoughts: params[:thoughts], user: user)
    Review.save
  end

end
