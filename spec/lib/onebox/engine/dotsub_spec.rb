require "spec_helper"

describe Onebox::Engine::DotsubOnebox do
  let(:link) { "http://funnyordie.com" }
  let(:html) { described_class.new(link).to_html }

  before do
    fake(link, response("dotsub.response"))
  end

  it "returns video title" do
    expect(html).to include("Twitter in Plain English")
  end

  it "returns video description" do
    expect(html).to include("A short explanation of the micro-blogging service, Twitter.")
  end

  it "returns video photo" do
    expect(html).to include("/665bd0d5-a9f4-4a07-9d9e-b31ba926ca78/p")
  end

  it "returns video URL" do
    expect(html).to include("dotsub.com/media/665bd0d5-a9f4-4a07-9d9e-b31ba926ca78/m/flv/")
  end

  it "returns URL" do
    expect(html).to include("http://dotsub.com/view/665bd0d5-a9f4-4a07-9d9e-b31ba926ca78")
  end
end