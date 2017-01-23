require_relative 'environment'
connection = PG.connect(ENV['PG_URL'])
enable :run

get '/' do
  connection.exec("SELECT 1") do |result|
    result.each do |row|
      return row.inspect
    end
  end
end