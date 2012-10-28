require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

include Colorable::Converter
describe Colorable::Converter do
  let(:conv) { Colorable::Converter }
  describe "#name2rgb" do
    context "when name exsist" do
      it "return a RGB value" do
        name2rgb("Alice Blue").should eql [240, 248, 255]
        name2rgb("Khaki").should eql [240, 230, 140]
        name2rgb("Mint Cream").should eql [245, 255, 250]
        name2rgb("Thistle").should eql [216, 191, 216]
      end
    end

    context "when name not exist" do
      it "raise NoNameError" do
        expect { name2rgb("Hello Yellow") }.to raise_error conv::NoNameError
      end
    end
  end

  describe "#rgb2name" do
    context "when name exist" do
      it "returns a name" do
        rgb2name([240, 248, 255]).should eql "Alice Blue"
        rgb2name([216, 191, 216]).should eql "Thistle"
      end
    end

    context "when name not exist" do
      it "returns nil" do
        rgb2name([240, 240, 240]).should be_nil
      end
    end

    context "when invalid rgb" do
      it "raise ArgumentError" do
        expect { rgb2name([0, 260, 0]) }.to raise_error ArgumentError
      end
    end
  end
  
  describe "#rgb2hsb" do
    context "when a valid rgb" do
      it "returns a HSB value" do
        rgb2hsb([240, 248, 255]).should eql [208, 6, 100]
        rgb2hsb([216, 191, 216]).should eql [300, 12, 85]
        rgb2hsb([240, 230, 140]).should eql [55, 42, 94]
      end
    end

    context "when a invalid rgb" do
      it "raise ArgumentError" do
        expect { rgb2hsb([100, 100, -10]) }.to raise_error ArgumentError
      end
    end
  end

  describe "#hsb2rgb" do
    
  end

  describe "#rgb2hex" do
    
  end

  describe "#hex2rgb" do
    
  end
end
