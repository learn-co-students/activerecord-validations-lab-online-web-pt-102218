class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait

  def must_be_clickbait
    if !/(Won't Believe|Secret|Top \d+|Guess)/.match(title)
      errors.add(:title, "Must be clickbaity")
    end
  end
end
