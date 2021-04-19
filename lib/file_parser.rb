# frozen_string_literal: true

class FileParser
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    array_of_visits = []

    File.foreach(file_path).map do |line|
      array_of_visits << line.split(/\s+/)
    end

    array_of_visits
  end

  private

  attr_reader :file_path
end
