require 'inject'

describe Array do
	
  context 'with a block' do

    it "can sum numbers" do
      expect([1, 2, 3, 4].inject{|memo, item| memo + item}).to eq 10
      expect([1, 2, 3, 4].my_inject{|memo, item| memo + item}).to eq 10
    end

    it "can minus numbers" do
      expect([1, 2, 3, 4].inject{|memo, item| memo - item}).to eq -8
      expect([1, 2, 3, 4].my_inject{|memo, item| memo - item}).to eq -8
    end

    it "can mutiply numbers" do
      expect([1, 2, 3, 4].inject{|memo, item| memo * item}).to eq 24
      expect([1, 2, 3, 4].my_inject{|memo, item| memo * item}).to eq 24
    end

  end

  context 'with a symbol' do

    it "can sum numbers" do
      expect([1, 2, 3, 4].inject(:+)).to eq 10
      expect([1, 2, 3, 4].sym_inject(:+)).to eq 10
    end

    it "can minus numbers" do
      expect([1, 2, 3, 4].inject(:-)).to eq -8
      expect([1, 2, 3, 4].sym_inject(:-)).to eq -8
    end

    it "can mutiply numbers" do
      expect([1, 2, 3, 4].inject(:*)).to eq 24
      expect([1, 2, 3, 4].sym_inject(:*)).to eq 24
    end
  end

end