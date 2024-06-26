class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, presence: true, length: { minimum: 6}
  validates :movie_id, presence: true
  validates :list_id, presence: true
  validates :list_id, uniqueness: { scope: :movie_id }
end
