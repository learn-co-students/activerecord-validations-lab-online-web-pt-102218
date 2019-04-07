class ClickbaityValidator < ActiveModel::Validator
    def validate(post)
        arr = ["Won't Believe", "Secret", "Top", "Guess"]
        arr.each do |word|
            if post.title && post.title.include?(word)
                post.errors[:title].clear
                break
            else 
                post.errors[:title] << "Not clickbaity enough."
            end 
        end 
    end 
end 