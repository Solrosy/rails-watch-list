class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true

  def movies_not_in_list
    Movie.all.reject { |movie| self.movies.include?(movie)}
  end
end
