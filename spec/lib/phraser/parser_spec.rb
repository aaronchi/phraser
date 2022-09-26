require "spec_helper"
require "yaml"

RSpec.describe Phraser::Parser do
  let(:files) { ["spec/fixtures/the-raven.txt"] }
  subject { described_class.new(files) }

  describe "#count" do
    context "when results option" do
      it "limits results" do
        expect(
          subject.count(results: 10).length
        ).to eq(10)
      end
    end

    context "when words option" do
      it "sets phrase length" do
        expect(
          subject.count(words: 4).first.first.split(" ").size
        ).to eq(4)
      end
    end
  end

  describe ".to_segments" do
    YAML.load_file("spec/fixtures/segments.yml").each do |example|
      it example["desc"] do
        expect(
          described_class.to_segments(example["text"])
        ).to eq(example["result"])
      end
    end
  end
end
