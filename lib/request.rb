require 'byebug'

class Request
  BASE_URL = 'https://backend-farm.plantvsundead.com'.freeze

  delegate :success?, to: :response

  def initialize(method:, url:, params: {}, body: {})
    @method = method
    @url = "#{BASE_URL}#{url}"
    @params = params
    @body = body.to_json
  end

  def call
    self
  end

  def content
    parsed_content
  end

  private

  def response
    @response ||= conn.send(method) do |req|
      req.body = body
    end
  end

  attr_reader :method, :url, :params, :body

  def conn
    @conn ||= Faraday.new(url: url, params: params, headers: headers)
  end

  def headers
    { 'Authorization': TokenGenerate.call }
  end

  def parsed_content
    JSON.parse(response.body)
  end
end
