require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end
  
  describe("#definition") do
    it("returns a defintion of a word") do
      test_definition = Definition.new({:definition => "The definition is something cool"})
      expect(test_definition.definition).to(eq("The definition is something cool"))
    end
  end

  describe('.all') do
    it('starts out empty') do
      expect(Definition.all()).to(eq([]))
    end
  end
  describe('.clear') do
    it('clears out all the saved definitions') do
      Definition.new(:definition => 'foul smelling breath')
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('adds a definition to the saved definitions array') do
      test_definition = Definition.new(:definition => "foul smelling breath")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end
  describe('.find') do
    it('returns a definition by its unique id number') do
      test_definition = Definition.new(:definition => "foul smelling breath")
      test_definition.save()
      test_definition2 = Definition.new(:definition => "a stimulant")
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end
end
