# frozen_string_literal: true

class PrintService
  def visits(visits)
    print_visits(visits_header, visits, newline)
  end

  def uniq_visits(visits)
    print_visits(uniq_visits_header, visits, newline)
  end

  private

  def print_visits(header, visits, newline)
    puts header

    visits.each_pair do |uri, visits_entries|
      puts "#{uri} #{visits_entries}"
    end

    puts newline
  end

  def visits_header
    'List of webpages with most visits:'
  end

  def uniq_visits_header
    'List of webpages with most unique visits:'
  end

  def newline
    "\n"
  end
end
