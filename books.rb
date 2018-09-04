# the creation of the class books
# beging of the class
class Books
    attr_accessor :title, :author, :langauge, :publisher
        def initialize(title,author,langauge,publisher)

        @title  = title
        @author = author
        @langauge = langauge
        @publisher = publisher
        
    end
    def introdcution
       puts  "<<< Welcome to the library >>>"
    end
# creation of the listing method
attr_reader :action
def book_action(action)
     @action = gets.chomp
end
  def display
     puts "suggetion: List, Find, Add, Quit?"
     
     case book_action(action)
     when "List"
        puts "listing..."
     when "Find"
        puts "Finding...."

     when "Add"
        puts "Adding..."
     when "quit"
        puts "Thank you for visting the library"
        exit!
     else
        puts "sorry didnt recognise you input"
     end
  end


    def conclusion
       puts "<<< Thank you have a good day >>>"
    end
end
# the end of the class

book = Books.new("","","","")
book.introdcution

puts "\n" * 2
book.display
puts "\n" * 2

book.conclusion