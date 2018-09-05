# Book Finder ####
#
# Launch this Ruby file from the command line 
# to get started.
#

# 
# constant variable carrying the actual directory
APP_ROOT = File.dirname(__FILE__)
$:.unshift(File.join(APP_ROOT, 'docs'))
require('library')

library = Library.new('books.txt')
library.start_up!





