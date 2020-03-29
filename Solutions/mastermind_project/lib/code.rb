class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
      chars.each {|char| return false if !POSSIBLE_PEGS.include?(char.upcase) }
      true
  end

  def self.random(length)
      random_pegs = []
      length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
      Code.new(random_pegs)
  end

  def self.from_string(pegs)
      chars = pegs.split("")
      Code.new(chars)
  end

  def initialize(chars)
      if Code.valid_pegs?(chars)
          @pegs = chars.map(&:upcase)
      else 
        raise "Invalid Pegs"
      end
  end

  def [](index)
      @pegs[index]
  end

  def length
      @pegs.length
  end

  def num_exact_matches(guess_code)
      exact_matches = 0
      guess_code.pegs.each.with_index do |guess_code_char, i|
          exact_matches += 1 if guess_code_char == @pegs[i]
      end
      exact_matches
  end

  def num_near_matches(guess_code)
      near_matches = 0
      (0...guess_code.length).each do |i|
          near_matches += 1 if @pegs[i] != guess_code[i] && @pegs.include?(guess_code[i])
      end
      near_matches
  end

  def ==(guess_code)
      guess_code.pegs == @pegs 
  end
  
end
