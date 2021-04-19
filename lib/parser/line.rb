# frozen_string_literal: true

class Line
  attr_reader :uri, :ip

  def initialize(uri, ip)
    @uri = uri
    @ip = ip
  end
end
