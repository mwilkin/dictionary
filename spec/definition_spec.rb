require('rspec')
require('definition')

describe(Definition) do
  describe("#definition") do
    it("returns a defintion of a word") do
      #something here
      expect(test_def.define).to(eq("The definition is something cool"))
    end
  end
end
