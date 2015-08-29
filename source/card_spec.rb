require_relative 'card'

describe Card do
  let(:card) { Card.new( term: "To create a second name for the variable or method.", definition: "alias" ) }

  describe 'initialize' do
    it 'should have arguments; instantiate card' do
      expect(card).to be_an_instance_of Card
    end
  end
end
