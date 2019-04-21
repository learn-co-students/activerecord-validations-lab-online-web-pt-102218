class Author < ActiveRecord::Base
  validates :name, presense: true, uniqueness: :true
  validates :phone_number, length: { is: 10 }
end
