require 'rails_helper'

RSpec.describe 'Book Index Page' do
  describe 'As a visitor, when I visit "/books"' do
    it "I see each book in the system and their attributes listed" do
      book_1 = Book.create!(title: "The Grand Design", number_of_pages: 198, year_published: 2010)
      book_2 = Book.create!(title: "Quantum", number_of_pages: 448, year_published: 2008)
      book_3 = Book.create!(title: "A Brief History of Time", number_of_pages: 256, year_published: 1988)
      author_1 = Author.create!(name: "Stephen Hawking")
      author_2 = Author.create!(name: "Manjit Kumar")
      book_author_1 = BookAuthor.create!(book: book_1, author: author_1)
      book_author_2 = BookAuthor.create!(book: book_2, author: author_2)
      book_author_3 = BookAuthor.create!(book: book_3, author: author_1)

      visit books_path

      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.number_of_pages)
      expect(page).to have_content(book_1.year_published)
      expect(page).to have_content(author_1.name)

      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_2.number_of_pages)
      expect(page).to have_content(book_2.year_published)
      expect(page).to have_content(author_2.name)

      expect(page).to have_content(book_3.title)
      expect(page).to have_content(book_3.number_of_pages)
      expect(page).to have_content(book_3.year_published)
      expect(page).to have_content(author_1.name)

    end
  end
end
