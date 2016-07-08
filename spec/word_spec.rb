require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#word") do
    it('it returns the word provided by the user') do
      test_word = Word.new({:word => "schralp"})
      expect(test_word.word()).to(eq("schralp"))
    end
  end

  describe('#save') do
    it('adds a word to the array of saved words') do
      test_word = Word.new({:word => "schralp"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  # describe('#id') do
  #
  # end

  describe('#add_definition') do
    it('adds a definition to the array of definitions') do
      test_word = Word.new({:word => "Yell"})
      test_word.add_definition("speak loudly")
      expect(test_word.definitions[0].define).to(eq("speak loudly"))
    end
  end

  # describe('.all') do
  #   it('')
  # end
  #
  # describe('.clear') do
  #
  # end

  describe('.find') do
    it('returns a word by its id') do
      test_word = Word.new({:word => 'bike'})
      test_word.save()
      test_word2 = Word.new({:word => 'car'})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

end
