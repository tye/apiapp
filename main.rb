require_relative 'environment'

begin
  connection = PG.connect(ENV['PG_URL'])
rescue PG::ConnectionBad => e
  puts e.inspect
  sleep 1
  retry
end

enable :run

get '/' do
  connection.exec("SELECT 1") do |result|
    result.each do |row|
      return row.inspect
    end
  end
end