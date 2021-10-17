class TokenGenerate
  TOKEN = ENV['TOKEN']

  def self.call
    TOKEN
  end
end
