class Demo < ApplicationRecord
  belongs_to :univercity
  belongs_to :team
  validates :name, {presence: true, length: {maximum:20}}
  validates :content_with_frame, {presence: true}
  # validates :univercity_name, {presence: true, length: {maximum:10}}
  # validates :team_name, {presence: true, length: {maximum:20}}
  validates :comment, {presence: true, length: {maximum:70}}
end
