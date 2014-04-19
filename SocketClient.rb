require 'socket'

def senddata(packet)
   data = packet.pack("C*")
   puts data.length
   @s.puts data
end

@s = TCPSocket.new '127.0.0.1',2000

senddata [0xaa,0x55,0x05,0x11]
senddata [0xaa,0x55,0x05,0x11]

