require 'pry'
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    # validates :title, inclusion: { in: [/Won't Believe/,/Secret/, /Top\d/, "Guess"]}

    validate :click_bate
    
    def click_bate
       
        if self.title.try(:match, /Won't Believe/) || self.title.try(:include, "Secret") || self.title.try(:match, '/Top.\d/') || self.title.try(:include, "Guess")
             true 
        else 
            self.errors.add(:title, "This article is clickbatey!") 
        end
    end
end
