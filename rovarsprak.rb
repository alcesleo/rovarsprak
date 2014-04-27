class RovarSprak

  @@consonants = %w{ b c d f g h j k l m n p q r s t v w x }

  def self.to text
    @@consonants.each do |c|
      text = text.gsub(c, "#{c}o#{c}")
    end
    text
  end

  def self.from text
    @@consonants.each do |c|
      text = text.gsub("#{c}o#{c}", c)
    end
    text
  end

end
