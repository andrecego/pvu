class Market
  URL = '/get-plants-filter-v2'.freeze

  def initialize(offset: 0, limit: 10, type: 1)
    @offset = offset
    @limit = limit
    @type = type
  end

  def call
    enqueue_plants
  end

  private

  def enqueue_plants
    raise 'Something is Wrong' unless response.success?

    response.content.fetch('data').each do |plant|
      PersistPlantWorker.perform_async(plant)
    end
  end

  def response
    @response ||= Request.new(method: :get, url: URL, params: params).call
  end

  attr_reader :offset, :limit, :type

  def params
    { offset: offset, limit: limit, type: type }
  end
end

