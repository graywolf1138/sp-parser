# frozen_string_literal: true

class UniqVisitsCounter
  def initialize(visits)
    @visits = visits
  end

  def call
    sort_uniq_counted_visits
  end

  private

  attr_reader :visits

  def sort_uniq_counted_visits
    count_uniq_visits.sort_by { |_key, value| value }.reverse.to_h
  end

  def count_uniq_visits
    group_visits.map { |uri, ip_range| [uri, ip_range.uniq(&:ip).count] }
  end

  def group_visits
    visits.group_by(&:uri)
  end
end
