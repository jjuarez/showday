require 'ostruct'
require 'showday/options_parser'


module ShowDay
  class CLI

    DAYS_BY_MONTH = [
      { name: "",          days: 00, sum:  00 },
      { name: "January",   days: 31, sum:  31 },
      { name: "February",  days: 28, sum:  59 },
      { name: "March",     days: 31, sum:  90 },
      { name: "April",     days: 30, sum: 120 },
      { name: "May",       days: 31, sum: 151 },
      { name: "June",      days: 30, sum: 181 },
      { name: "July",      days: 31, sum: 212 },
      { name: "August",    days: 31, sum: 243 },
      { name: "September", days: 30, sum: 273 },
      { name: "October",   days: 31, sum: 304 },
      { name: "November",  days: 30, sum: 334 },
      { name: "December",  days: 31, sum: 365 }
    ]

    DAYS_BY_MONTH_LEAP = [
      { name: "",          days: 00, sum:  00 },
      { name: "January",   days: 31, sum:  31 },
      { name: "February",  days: 29, sum:  60 },
      { name: "March",     days: 31, sum:  91 },
      { name: "April",     days: 30, sum: 121 },
      { name: "May",       days: 31, sum: 152 },
      { name: "June",      days: 30, sum: 182 },
      { name: "July",      days: 31, sum: 213 },
      { name: "August",    days: 31, sum: 244 },
      { name: "September", days: 30, sum: 274 },
      { name: "October",   days: 31, sum: 305 },
      { name: "November",  days: 30, sum: 335 },
      { name: "December",  days: 31, sum: 366 }
    ]

    def self.leap_year?(year)
      (year % 4 == 0)
    end

    def valid_day?
      (@day == 366 && @leap) || (@day > 0 && @day < 366)
    end

    def calculate_month
      (1..12).each { |i| return i if @days_by_month[i][:sum] >= @day }
    end

    def calculate_day(month)
      @day - @days_by_month[month-1][:sum]
    end

    def initialize(parameters)

      @year = parameters[:year]
      @day  = parameters[:day]
      @leap = CLI.leap_year?(@year)

      fail("#{@day} is not a valid day for year: #{@year}") unless valid_day?

      @days_by_month = @leap ? DAYS_BY_MONTH_LEAP : DAYS_BY_MONTH

      self
    end

    def run

      month = calculate_month
      day   = calculate_day(month)

      OpenStruct.new({ day: day, month: month, year: @year })
    end
  end
end
