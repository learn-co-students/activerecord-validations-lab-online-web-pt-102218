class Post < ActiveRecord::Base
  validates :title, presense: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(fiction non-fiction) }
  validates :title, exclusion: { in: %w(/\b(Won't Believe|Secret|Top \d|Guess)\b/) }
end
