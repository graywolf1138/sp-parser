# frozen_string_literal: true

require_relative 'file_parser'
require_relative 'line'

class Parser
  def initialize(file_path: nil)
    @file_path = file_path
    @file_parser = FileParser
    @file_line = Line
  end

  def perform
    parsed_file
  end

  private

  attr_reader :file_path, :file_parser, :file_line

  def parsed_file
    file_parser.new(file_path, file_line).call
  end
end
