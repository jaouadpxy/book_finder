
require 'test/unit'
require_relative '../books.rb'

class Books_test < Test::Unit::TestCase
    def test_title

    book = Books.new("Python by an idiot",'Matthew','Python','Wrox')
    assert_equal("Python by an idiot",book.title)
    end

    def test_author

        book = Books.new("Python by an idiot",'Matthew','Python','Wrox')
        assert_equal("Matthew",book.author)
    end

    def test_langauge

        book = Books.new("Python by an idiot",'Matthew','Python','Wrox')
        assert_equal("Python",book.langauge)
    end

    def test_publisher

        book = Books.new("Python by an idiot",'Matthew','Python','Wrox')
        assert_equal("Wrox",book.publisher)
    end
end