require 'book_file'

describe BookFile do

  let(:test_file) { 'spec/fixtures/books_test.txt' }
  let(:test_file_path) { File.join(APP_ROOT, test_file) }
  let(:valid_file) { BookFile.new(:filepath => test_file) }
  
  let(:new_file)  { 'spec/fixtures/new_books_test.txt' }
  let(:new_file_path) { File.join(APP_ROOT, new_file) }
  let(:blank_file) { BookFile.new(:filepath => new_file) }

  describe '#initialize' do
    
    it "returns an instance when given no options" do
      expect(subject).not_to be_nil
      expect(subject.class).to eq(BookFile)
    end

    it 'uses :filepath option to locate a valid file' do
      expect(valid_file.exists?).to be_truthy
    end
    
  end
end
