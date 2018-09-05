require 'book'

describe Book do

  let(:test_file) { 'spec/fixtures/books_test.txt' }
  let(:Ruby) { Book.new(:title => 'Ruby', :language => 'Ruby', :author => 'Micheal Hart|', :publisher => 'learn enough') }

  describe '#initialize' do

    context 'with no options' do
      # subject would return the same thing
      let(:no_options) { Book.new }

      it 'sets a default of "" for :title'

      it 'sets a default of "unknown" for :language'

      it 'does not set a default for :author'

      it 'does not set a default for :publisher'
    end
    
    context 'with custom options' do
      
      it 'allows setting the :title'

      it 'allows setting the :language'

      it 'allows setting the :author'

      it 'allows setting the :publisher'
    end

  end
  
end
