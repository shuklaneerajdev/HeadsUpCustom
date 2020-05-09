class Movie < ApplicationRecord
  validates :title, uniqueness: true
end
