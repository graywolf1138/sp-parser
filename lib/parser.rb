# frozen_string_literal: true

require_relative 'file_parser'
require_relative 'line'
require_relative 'most_visits_counter'
require_relative 'uniq_visits_counter'

class Parser
  def initialize(file_path: nil, most_visits: MostVisitsCounter, uniq_visits: UniqVisitsCounter)
    @file_path = file_path
    @most_visits = most_visits
    @uniq_visits = uniq_visits
    @file_parser = FileParser
    @file_line = Line
  end

  def perform
    print count(most_visits)
    print count(uniq_visits)
  end

  private

  attr_reader :file_path, :file_parser, :file_line, :most_visits, :uniq_visits

  def count(count_method)
    count_method.new(parsed_file).call
  end

  def parsed_file
    @parsed_file ||= file_parser.new(file_path, file_line).call
  end
end
