Class Word
  @@words = []
  attr_reader(:word, :definition, :id)

  define_method(:initialize) do |word|
    @word = attributes.fetch(:word)
    @definitions = []
    @id = @@words.length + 1
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_method(:clear) do
    @@words = []
  end

  define_method(:all) do
    @@words
  end

  define_method(:add_definition) do |definition|
    new_definition = Definition.new( #something in here )
  end

  define_singleton_method(:find) do |id|
    @@words.each() do |word|
      return word if word.id.eql?(id)
    end
  end
end
