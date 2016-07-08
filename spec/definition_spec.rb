require('rspec')
require('definition')

describe(Definition) do
  describe("#definition") do
    it("returns a defintion of a word") do
      test_definition = Definition.new({:definition => "The definition is something cool"})
      expect(test_definition.definition).to(eq("The definition is something cool"))
    end
  end
end
