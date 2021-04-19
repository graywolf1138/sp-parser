# frozen_string_literal: true

class FileParser
  def initialize(file_path, file_line = Line)
    @file_path = file_path
    @file_line = file_line
  end

  def call
    File.foreach(file_path).map do |line|
      parse_line_data(line)
    end
  end

  private

  attr_reader :file_path, :file_line

  def parse_line_data(line)
    file_line.new(*line.split(/\s+/))
  end
end
