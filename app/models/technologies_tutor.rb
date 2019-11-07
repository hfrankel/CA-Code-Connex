class TechnologiesTutor < ApplicationRecord
  belongs_to :tutor, dependent: :destroy
  belongs_to :technology

  enum level: [:fresh, :experienced, :master]
end
