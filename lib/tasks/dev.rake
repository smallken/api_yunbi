namespace :dev do
  task :fetch_ticker => :environment do
    puts "Fetch ticker data..."
    response = RestClient.get "https://yunbi.com/api/v2/markets"
    data = JSON.parse(response.body)
    data.each do |m|
      existing_ticker = Ticker.find_by_ticker_id( m["id"] )

      if existing_ticker.nil?
        Ticker.create!( :ticker_id => m["id"], :ticker_name => m["name"])
  end
end
puts "Total: #{Ticker.count} tickers"
  end
end
