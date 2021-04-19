# frozen_string_literal: true

require_relative 'file_parser'
require_relative 'line'
require_relative 'most_visits_counter'
require_relative 'uniq_visits_counter'
require_relative 'print_service'
require_relative 'validator_service'

class Parser
  def initialize(file_path: nil, most_visits: MostVisitsCounter, uniq_visits: UniqVisitsCounter, **services)
    @file_path = file_path
    @most_visits = most_visits
    @uniq_visits = uniq_visits
    @file_parser = services[:file_parser]
    @validator = services[:validator]
    @file_line = services[:file_line]
    @print_service = services[:print_service]
  end

  def perform
    validator.valid?(file_path)

    print_service.new.visits(count(most_visits))
    print_service.new.uniq_visits(count(uniq_visits))
  rescue StandardError => e
    warn e.message
    exit
  end

  private

  attr_reader :file_path, :file_parser, :file_line, :most_visits, :uniq_visits, :validator, :print_service

  def count(count_method)
    count_method.new(parsed_file).call
  end

  def parsed_file
    @parsed_file ||= file_parser.new(file_path, file_line).call
  end
end
