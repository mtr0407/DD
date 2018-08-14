class Univercity < ApplicationRecord
    validates :name, presence: true
    validates :circle_name, presence: true
    has_many :teams, dependent: :destroy
end