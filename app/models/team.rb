class Team < ApplicationRecord
  has_many :demos, dependent: :destroy
  belongs_to :univercity
end


