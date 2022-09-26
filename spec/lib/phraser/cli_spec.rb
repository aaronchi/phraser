require "spec_helper"

RSpec.describe Phraser::CLI do
  let(:files) { "spec/fixtures/moby-dick.txt" }

  describe ".start" do
    it "prints output" do
      expect {
        described_class.start(["count", files])
      }.to output(/^the sperm whale - 85/).to_stdout
    end
  end
end
