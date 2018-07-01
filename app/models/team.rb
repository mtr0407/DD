class Team < ApplicationRecord
  has_many :demos
  belongs_to :univercity
end


