require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validations' do
     it { should validate_presence_of :title }
     it { should validate_presence_of :number_of_pages }
     it { should validate_presence_of :year_published }
  end

  describe 'Relationships' do
    it { should have_many :book_authors }
    it { should have_many(:authors).through(:book_authors) }
  end
end
