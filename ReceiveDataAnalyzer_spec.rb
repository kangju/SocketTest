require File.dirname(__FILE__)+'/ReceiveDataAnalyzer.rb'

describe ReceiveDataAnalyzer,"analyze" do

   before do
      @analyzer = ReceiveDataAnalyzer.new
   end

   describe 'receive[0xaa,0x55,0x01,0x11]' do

      it 'result is not null' do
         @analyzer.analyze([0xaa,0x55,0x01,0x11]).should_not be_nil
      end

      it 'size is 1' do
         @analyzer.analyze([0xaa,0x55,0x01,0x11]).length.should eq 1
      end

   end

end