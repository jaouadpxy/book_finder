# Book Finder ####
#
# Launch this Ruby file from the command line 
# to get started.

# require "#{APP_ROOT}/docs/library"
# require File.join(APP_ROOT, 'docs', 'library.rb')
# require File.join(APP_ROOT, 'docs', 'library')
# $:.unshift(File.join(APP_ROOT, 'docs'))


# the login  Feature to access the app


user = ""
tries = 0
until user =="admin"
    puts "Please enter a valid password :"
    user = gets.chomp.strip
    tries += 1
    if user != "admin"
        if tries == 3
            puts "#{tries} times incorrect password You exceded the number of tries please come back in 30 minutes "
            exit!
        end
    else
        # constant variable carrying the actual directory
        APP_ROOT = File.dirname(__FILE__)
        $:.unshift(File.join(APP_ROOT, 'docs'))
        require('library')
        library = Library.new('books.txt')
        library.start_up!        
    end
end




