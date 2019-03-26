class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value
      clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
      clickbait.each do |phrase|
        if value.include?(phrase)
          return true
        end
      end
    end
    record.errors[attribute] << (options[:message] || "not clickbaity enough")
  end

  
end
