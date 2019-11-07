class Tutor < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :ratings
  has_many :technologies_tutors
  has_many :technologies, through: :technologies_tutors

  enum experience: { junior: 0, mid: 1, senior: 2 }
end
