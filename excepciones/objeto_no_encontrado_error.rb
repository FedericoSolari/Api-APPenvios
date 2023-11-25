class ObjetoNoEncontrado < StandardError
  def initialize(message, id)
    super("#{message}: #{id}")
  end
end
