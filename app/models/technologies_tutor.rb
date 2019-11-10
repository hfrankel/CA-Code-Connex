class TechnologiesTutor < ApplicationRecord
  belongs_to :tutor, dependent: :destroy
  belongs_to :technology
end
