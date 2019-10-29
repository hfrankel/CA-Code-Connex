class Technology < ApplicationRecord
  has_many :technologies_tutors
  has_many :tutors, through: :technologies_tutors
end
