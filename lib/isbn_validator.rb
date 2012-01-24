class IsbnValidator 
VALID_CHARACTERS =['1','2','3','4','5','6','7','8','9','0','X']
  #attr_accessor : isbn
  attr_reader :isbn
  #attr_writer :isbn

	def initialize(isbn)
    	if isbn.nil?
	@isbn=""
	else 
	@isbn = cleanup_isbn(isbn)
	end
    end
	
    	
#Q5
	def valid?
if @isbn.size==10|| @isbn.size==13
return true
else return false
end 
end
def self.valid_character?(c)
return c=='1'||c=='2'||c=='3'||c=='4'||c=='5'||c=='6'||c=='7'||c=='8'||c=='9'||c=='0'||c=='x'||
	
	end
	private
	def cleanup_isbn(isbn)
#Excercise 1 Q 2,3,4
	return isbn.downcase.gsub("-","").gsub(" ","")
	end

end

