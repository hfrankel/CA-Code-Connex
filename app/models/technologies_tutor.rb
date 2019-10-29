class TechnologiesTutor < ApplicationRecord
  belongs_to :tutor
  belongs_to :technology

  enum level: [ :fresh, :experienced, :master]
end
