class MyValidator < ActiveModel::Validator
    def validate(post)
        if post.title
            post.errors[:title] << 'false' if ["Won't Believe", "Secret", "Top [number]", "Guess"].none? do |phrase|
             post.title.include?(phrase)
            end
        end
    end
end

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with MyValidator

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
end
