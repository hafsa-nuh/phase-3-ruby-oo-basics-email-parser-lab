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

        @email.split(/,?\s/).uniq
    end
end
