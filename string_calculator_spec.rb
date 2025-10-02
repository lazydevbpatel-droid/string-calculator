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
end
