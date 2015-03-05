require 'choice'

#
# = ShowDay: As module acting as a namespace
module ShowDay
  Choice.options do
    header 'Options:'
    header

    option :year, required: false do
      short '-y'
      long '--year=YEAR'
      default Time.now.year
      cast Integer
      desc 'The year'
    end

    option :day, required: true do
      short '-d'
      long '--day=DAY'
      cast Integer
      desc 'The day'
    end

    separator ''
  end
end
