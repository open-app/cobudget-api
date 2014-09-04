class Round < ActiveRecord::Base
  belongs_to :budget
  has_many :round_projects, dependent: :destroy
  has_many :projects, through: :round_projects
end