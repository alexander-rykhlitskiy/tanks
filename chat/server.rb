require 'socket'                # Get sockets from stdlib
require 'pry'

server = TCPServer.open(2000)   # Socket to listen on port 2000
clients = []
loop do
  clients << server.accept
  Thread.new(clients.last) do |client|
    while line = client.gets
      binding.pry
      clients.each { |c| c.puts line if c != client }
      puts clients.count
    end
    client.close
  end
end
