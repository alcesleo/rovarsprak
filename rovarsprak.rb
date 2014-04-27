class RovarSprak

  @@consonants = %w{ b c d f g h j k l m n p q r s t v w x }

  def self.to text
    @@consonants.reduce(text) { |text, c| text.gsub(c, expand(c)) }
  end

  def self.from text
    @@consonants.reduce(text) { |text, c| text.gsub(expand(c), c) }
  end

  private

  def self.expand consonant
    "#{consonant}o#{consonant}"
  end

end

class CLI
  def initialize(argv)
    @argv = argv
  end

  def text
    @argv[1..@argv.size].join(' ')
  end

  def direction
    if @argv[0] =~ /to|from/
      @argv[0]
    else
      raise 'you must specify wether to translate "to" or "from" as the first argument'
    end
  end

  def output
    RovarSprak.send(direction, text)
  end
end

if __FILE__ == $0
  puts CLI.new(ARGV).output
end
