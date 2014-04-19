require 'socket'
require File.dirname(__FILE__)+'/ReceiveDataAnalyzer.rb'

server = TCPServer.new 2000

socketThreads = []

loop do
   client = server.accept
   
   socketThreads << Thread.start(client) do |s|
      analyzer = ReceiveDataAnalyzer.new
      while line = s.gets.chomp!
          puts "size:#{line.length}"
          payload = analyzer.analyze(line.unpack("C*"))
          next if payload.nil?
          puts payload
      end
   end
end
