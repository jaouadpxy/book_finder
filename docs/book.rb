# 

class Book
    attr_accessor :title, :language, :author, :publisher
    def initialize(args ={})
        @title     = args[:title]     ||  ""
        @language  = args[:language]  ||  ""
        @author    = args[:author]    ||  ""
        @publisher = args[:publisher] ||  ""
    end
    
    @@filepath = nil
    def self.filepath=(path=nil)
       @@filepath = File.join(APP_ROOT, path) 
    end
    def self.file_exists?
        if @@filepath && File.exists?(@@filepath)
           return true 
     else
            return false 
        end

        #class should knoew if the book file exists 
    end
    def self.file_usable?
       return false unless @@filepath 
       return false unless File.exists?(@@filepath) 
       return false unless File.readable?(@@filepath) 
       return false unless File.writable?(@@filepath) 
       return true
        
    end
    def self.create_file
        #create the book file
                   
        File.open(@@filepath,'w') unless file_exists?
        return file_usable?
    end
    def self.saved_books
        #read the book file
        books = []
        if file_usable?
          file = File.new(@@filepath, 'r')
          file.each_line do |line|
            books << Book.new.import_line(line.chomp)
         end
          file.close
        end
        #return instance of book
        return books
    end
     def import_line(line)
         line_array = line.split("\t")
         @title, @language, @author, @publisher = line_array
         return self
     end
    def save
        return false unless Book.file_usable?
        
        File.open(@@filepath, 'a') do |file|
            file.puts "#{[@title, @language, @author, @publisher].join("\t")}\n"
        end
        return true
    end
    def self.build_book
        args = {}
      
        print " Book title :"
        args[:title] = gets.chomp.strip
        
        print " Book language :"
        args[:language] = gets.chomp.strip
        
        print " Book author :"
        args[:author] = gets.chomp.strip
        
        print " Book publisher :"
        args[:publisher] = gets.chomp.strip

        return self.new(args)
    end
end


