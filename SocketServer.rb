require 'socket'

server = TCPServer.new 2000

socketThreads = []

loop do
   client = server.accept
   
   socketThreads << Thread.start(client) do |s|
      while line = s.gets
         puts line.length
         puts line.unpack("H*")
      end
   end
end