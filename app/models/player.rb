class Player < ApplicationRecord
  belongs_to :game
  belongs_to :score, optional: true
  has_many :rounds

  scope :by_creator, -> { where(creator: true) }

  validates :username, presence: true
end
