class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.include? "Won't Believe" "Secret" "Top[number]" "Guess"
      record.errors[:title] << 'Need to have a title that is catchbait!'
    end
  end
end