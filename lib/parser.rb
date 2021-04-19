# frozen_string_literal: true

require_relative 'file_parser'
require_relative 'line'
require_relative 'most_visits_counter'
require_relative 'uniq_visits_counter'
require_relative 'print_service'

class Parser
  def initialize(file_path: nil, most_visits: MostVisitsCounter, uniq_visits: UniqVisitsCounter, print_service: PrintService)
    @file_path = file_path
    @most_visits = most_visits
    @uniq_visits = uniq_visits
    @file_parser = FileParser
    @file_line = Line
    @print_service = print_service.new
  end

  def perform
    print_service.visits(count(most_visits))
    print_service.uniq_visits(count(uniq_visits))
  end

  private

  attr_reader :file_path, :file_parser, :file_line, :most_visits, :uniq_visits, :print_service

  def count(count_method)
    count_method.new(parsed_file).call
  end

  def parsed_file
    @parsed_file ||= file_parser.new(file_path, file_line).call
  end
end
