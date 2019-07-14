class Book < ApplicationRecord
  validates_presence_of :title, :number_of_pages, :year_published

  has_many :book_authors
  has_many :authors, through: :book_authors
end
