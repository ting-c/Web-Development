require 'byebug'

def all_words_capitalized?(words)
    words.all? {|word| word == word.capitalize}
end

def no_valid_url?(urls)
    valid = [ '.com', '.net', '.io', '.org']
    urls.none? do |url|
        valid.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(students)
    students.any? do |student|
        avg = student[:grades].inject { |sum, score| sum + score } / student[:grades].length
        avg >= 75
    end
end