class Univercity < ApplicationRecord
    validates :name, presence: true
    validates :circle_name, presence: true
    has_many :teams
    has_many :demos
end