class Post < ActiveRecord::Base
    #include ActiveModel::Validations
    #validates_with MyValidator
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait
    #validates :title, inclusion: { within: %w("Won't Believe" "Secret" "Top#[Number]" "Guess")}

    def clickbait
        errors.add(:title, "Not clickbait") unless title.present? && title["Won't Believe"] #"Top[number]" "Secret" "Guess"
        
    end
end
