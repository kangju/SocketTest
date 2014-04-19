class ReceiveDataAnalyzer

   def initialize
      @findfirsthead = false
      @findheader = false
      @receiveDataCache = []
      @payloadcount = 0;
      @payload = []
   end

   def analyze(receiveData)
      @receiveDataCache << receiveData
      @receiveDataCache.flatten!
      createPacket = false
      count = 0;

      while !@receiveDataCache.empty? && !createPacket
         count += 1
         d = @receiveDataCache.shift

         if @payloadcount > 0
            @payload << d
            @payloadcount -= 1
            createPacket = @payloadcount == 0
            next
         end

         if @findheader
            @findheader = false
            @payloadcount = d
            next
         end

         if @findfirsthead && d == 0x55
            @findheader = true
            @findfirsthead = false
            next
         else
            @findfirsthead = false
         end

         if d == 0xaa
            @findfirsthead = true
            next;
         end
      end

      result = nil
      if(createPacket)
         result = Array.new @payload
         @payload.clear
      end
      return result
   end
end