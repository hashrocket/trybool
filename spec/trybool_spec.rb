require "spec_helper"

RSpec.describe(Trybool) do
  describe ".parse" do
    context "when provided a 'truthy' string value" do
      it "returns true" do
        expect(described_class.parse("true")).to eq(true)
      end
    end

    context "when provided true" do
      it "returns true" do
        expect(described_class.parse(true)).to eq(true)
      end
    end

    context "when provided a 'falsey' string value" do
      it "returns false" do
        expect(described_class.parse("false")).to eq(false)
      end
    end

    context "when provided false" do
      it "returns false" do
        expect(described_class.parse(false)).to eq(false)
      end
    end

    context "when provided a truthy value configuration" do
      before do
        described_class.configure do |config|
          config << "hello"
        end
      end

      it "returns true when value matches configured value" do
        expect(described_class.parse("hello")).to eq(true)
      end

      it "returns false when value is no match for configured values" do
        expect(described_class.parse("ohmy")).to eq(false)
      end
    end
  end

  describe "configuration" do
    context "when provided a single value" do
      it "is added to white list of truthy values" do
        described_class.configure do |config|
          config << "hello"
        end

        expect(described_class.truthy_values).to include("hello")
      end
    end

    context "when provided multiple single values" do
      it "is added to white list of truthy values" do
        described_class.configure do |config|
          config << "hello"
          config << "howdy"
        end

        expect(described_class.truthy_values).to include("hello")
        expect(described_class.truthy_values).to include("howdy")
      end
    end

    context "when provided multiple values as a collection" do
      it "is added to white list of truthy values" do
        described_class.configure do |config|
          config << ["hello", "howdy"]
        end

        expect(described_class.truthy_values).to include("hello")
        expect(described_class.truthy_values).to include("howdy")
      end
    end
  end
end
