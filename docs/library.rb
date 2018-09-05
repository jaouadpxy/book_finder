# 
require 'book'
class Library
  # Configuration Class requires the user to insert either one of
  # and display it to the user and a suggestions
    class Config
        @@action =['list','find', 'add', 'quit']
        def self.actions
            @@action
        end
    end
    def initialize(path=nil)
        #locate the book text file at path
         Book.filepath = path
         if Book.file_usable?
            puts "found the book"
        # or create a new file
         elsif Book.create_file
        #exit if create fails
        puts "Created Book file"
         else
            puts "Sorry nothing Found. \n\n"
            exit!
         end
    end

    def start_up!
        introdcution

        #action loop
        result = 0
         until result == :quit
            # what do you want to do?(list, find, add, quit)
            action, args = get_action

            #do that action
            result = do_action(action, args)
            #repeat until user quits            
         end
         conclusion
    end
def get_action
        action = nil
        #keep asking for user input until we get valid action
        until Library::Config.actions.include?(action)
            # what do you want to do?(list, find, add, quit)
            puts "Actions:" + Library::Config.actions.join(", ") if action
            print "Please Insert you Request:>"
            user_response = gets.chomp
            args = user_response.downcase.strip.split(' ')
            action = args.shift

        end
        return action, args
    end
    def do_action(action, args=[])
       case action
       when "list"
            list
        when "find"
            keyword = args.shift
            find(keyword)

        when "add"
            add
        when "quit"
            return :quit
        else
            #could use rescue function here instead of else
            puts "\n I dont understand that command\n"
        end
end
#list method
 def list
    output_action_header("Listing books")
    
     books = Book.saved_books

    # Display Books
    output_book_table(books)
 end
# methode add
def add
    puts "\n\n Add a book\n\n".downcase
    book = Book.build_book

    if book.save   
        puts "\n the book added"
    else
        puts "Error occured: Book not added\n\n"
    end
end
#find method
def find(keyword="")
    #"Find book".lcenter(30)
    #output_action_header("Finding a book")

    if keyword
     books = Book.saved_books
     
     found = books.select do |bk|
        bk.title.downcase.include?(keyword.downcase)    ||
        bk.language.downcase.include?(keyword.downcase) ||
        bk.author.downcase.include?(keyword.downcase)   ||
        bk.publisher.downcase.include?(keyword.downcase)
     end
       output_book_table(found)
    else
        puts "Search using words like java Python, javascript   ...."
        puts "Like 'find c#'  'find java' ......"
    end
    
end


    def introdcution
                #puts "-" * "<<< Welcome to the library >>>".length
                puts  "<<<\n\n Welcome to the library>>> \n\n"
                puts  "This an interaction guide to help you find your book \n\n"
                #puts "-" * "<<< Welcome to the library >>>".length
     end

     def conclusion
                 #puts "-" * "<<< Thank you have a good day >>>".length
                    puts "<<< Thank you have a good day >>>"
                 #puts "-" * "<<< Thank you have a good day >>>".length
     end

    #private
    def output_action_header(txt)
        puts "\n#{txt.upcase.center(73)}\n\n"
    end

    def output_book_table(books=[])
        print " " + "Title".ljust(30)
        print " " + "Language".ljust(20)
        print " " + "Author".ljust(10)
        print " " + "Publisher".rjust(6) + "\n"
        puts "-" * 73

       books.each do |bk|
          line =  " " << bk.title.ljust(30) 
          line << " " + bk.language.ljust(20)
          line << " " + bk.author.ljust(10)
          line << " " + bk.publisher.rjust(6) + "\n"
          puts line
       end
        puts "No listings found" if books.empty?
        puts "-" * 73
      end
    

end

