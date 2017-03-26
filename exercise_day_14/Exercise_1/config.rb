@client = Mysql2::Client.new(
      :host => "localhost", 
      :port => 3306, 
      :database => "foolball",
      :username => "root", 
      :password => "huy10573987",
      :reconnect => true
)