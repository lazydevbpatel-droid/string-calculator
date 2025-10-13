require "rspec"
require_relative "string_calculator"

RSpec.describe StringCalculator do
  let(:sc) { StringCalculator.new }

  it "returns 0 for empty string" do
    expect(sc.add("")).to eq(0)
  end

  it "returns number itself for single input" do
    expect(sc.add("1")).to eq(1)
  end

  it "returns sum for two numbers" do
    expect(sc.add("1,2")).to eq(3)
  end

  it "returns sum for multiple numbers" do
    expect(sc.add("1,2,3,4")).to eq(10)
  end

  it "handles newlines between numbers" do
    expect(sc.add("1\n2,3")).to eq(6)
  end

  it "Support different delimiters" do
    expect(sc.add("//;\n1;2")).to eq(3)
  end

  it "raises error for negative numbers" do
    expect { sc.add("1,-2,-3") }
      .to raise_error("negatives not allowed: -2, -3")
  end

  it "tracks how many times add was called" do
    sc.add("1,2")
    sc.add("3")
    expect(sc.get_called_count).to eq(2)
  end
  
  it "ignores numbers greater than 1000" do
    expect(sc.add("2,1001")).to eq(2)
    expect(sc.add("1000,3")).to eq(1003) # 1000 is allowed
  end

  it "supports custom delimiters of any length" do
    expect(sc.add("//[***]\n1***2***3")).to eq(6)
  end

  it "supports multiple custom delimiters" do
    expect(sc.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it "treats * as multiply sign" do
    expect(sc.add("//[*]\n5*2*3")).to eq(30)
  end
end
