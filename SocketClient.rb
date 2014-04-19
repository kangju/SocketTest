require 'socket'

s = TCPSocket.new '127.0.0.1',2000

packet = [0xaa,0x55,0x01,0x11]
msg = []

packet.map! do |b|
   "%02X" % b
end
msg << packet.join
data = msg.pack("H*")
puts data.length
s.puts data