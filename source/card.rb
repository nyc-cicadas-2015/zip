class Card
  attr_accessor :term, :definition

  def initialize(args)
    @definition = args.fetch(:definition)
    @term = args.fetch(:term)
  end
end
