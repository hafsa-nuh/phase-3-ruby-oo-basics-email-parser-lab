# Build a class EmailAddressParser that accepts a string of unformatted 
# emails. The parse method on the class should separate them into
# unique email addresses. The delimiters to support are commas (',')
# or whitespace (' ').
class EmailAddressParser
    attr_accessor :email
    def initialize(email)
        @email= email
    end
    def parse
        # split(%r{,\s*}) = expected: ["avi@test.com", "arel@test.com"]
        # got: ["avi@test.com arel@test.com"]
        # split(',') = expected: ["avi@test.com", "arel@test.com"]
        # got: ["avi@test.com", " arel@test.com"]
        # split("\\s+") = expected: ["avi@test.com", "arel@test.com"]
        # got: ["avi@test.com, arel@test.com"]
        # split(/,?\s/)  = i dont understand it
        # -----> and answer from blockbox <-------#
        # class TokenArrayParser
        #     SPLIT_CHAR = '|'.freeze
        #     def initialize(str)
        #         @str = str
        #     end
        #     def parse
        #         separate_on_valid_comma.split(SPLIT_CHAR)
        #     end
        #     private
        #     def separate_on_valid_comma
        #         dup = @str.dup
        #         paren_count = 0
        #         dup.length.times do |idx|
        #             case dup[idx]
        #             when '(' then  paren_count += 1
        #             when ')' then paren_count -= 1
        #             when ',' then dup[idx] = SPLIT_CHAR if paren_count.zero?
        #             end
        #         end
        #         dup
        #     end
        # end
        # %w(id,name,title(first_name,last_name)id,name,title(first_name,last_name,address(street,pincode(id,code)))first_name,last_name,address(street,pincode(id,code)),city(name)a,b(c(d),e,f)id,name,title(first_name,last_name),pub(name,address)).each {|str| puts TokenArrayParser.new(str).parse.inspect }

# =>
# ["id", "name", "title(first_name,last_name)"]
# ["id", "name", "title(first_name,last_name,address(street,pincode(id,code)))"]
# ["first_name", "last_name", "address(street,pincode(id,code))", "city(name)"]
# ["a", "b(c(d),e,f)"]
# ["id", "name", "title(first_name,last_name)", "pub(name,address)"]
  


        @email.split(/,?\s/).uniq
    end
end
