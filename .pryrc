# frozen_string_literal: true

puts "#{__FILE__} loaded..."
load File.dirname(__FILE__) + '/.railsrc' if ENV['RAILS_ENV']

def sql_out
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
