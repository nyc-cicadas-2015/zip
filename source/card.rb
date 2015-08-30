class Card
  attr_reader :term, :definition

  def initialize(args)
    @definition = args.fetch(:definition)
    @term = args.fetch(:term)
  end
end
