require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'Validations' do
     it { should validate_presence_of :name }
  end

  describe 'Relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'Instance Methods' do
    it '.average_pages' do
      book_1 = Book.create!(title: "The Grand Design", number_of_pages: 198, year_published: 2010)
      book_2 = Book.create!(title: "Quantum", number_of_pages: 448, year_published: 2008)
      book_3 = Book.create!(title: "A Brief History of Time", number_of_pages: 256, year_published: 1988)
      author_1 = Author.create!(name: "Stephen Hawking")
      author_2 = Author.create!(name: "Manjit Kumar")
      book_author_1 = BookAuthor.create!(book: book_1, author: author_1)
      book_author_2 = BookAuthor.create!(book: book_2, author: author_2)
      book_author_3 = BookAuthor.create!(book: book_3, author: author_1)

      expect(author_1.average_pages).to eq(227)
    end
  end
end
