# frozen_string_literal: true

class MostVisitsCounter
  def initialize(visits)
    @visits = visits
  end

  def call
    count_visits.sort_by { |_key, value| value }.reverse.to_h
  end

  private

  attr_reader :visits

  def count_visits
    group_visits.map { |uri, ip_range| [uri, ip_range.count(&:ip)] }
  end

  def group_visits
    visits.group_by(&:uri)
  end
end
