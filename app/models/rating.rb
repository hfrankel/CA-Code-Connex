class Rating < ApplicationRecord
  belongs_to :session
  belongs_to :tutor
end
