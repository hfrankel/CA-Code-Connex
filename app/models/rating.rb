class Rating < ApplicationRecord
  belongs_to :session
  belongs_to :tutor

  # limits rating score from 1 to 5
  validates :score, :inclusion => { :in => 1..5 }
end
