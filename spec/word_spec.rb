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

  describe('#id') do
    it('tracks the id of a word') do
      test_word = Word.new({:word => "contacts"})
      expect(test_word.id()).to(eq(1))
    end

  end

  describe('#add_definition') do
    it('adds a definition to the array of definitions') do
      test_word = Word.new({:word => "Yell"})
      test_definition = Definition.new({:definition => "speak loudly"})
      test_word.add_definition(test_definition)
      expect(test_word.definitions[0]).to(eq(test_definition))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('removes the saved words and definitions') do
      Word.new({:word => "watch"}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

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
