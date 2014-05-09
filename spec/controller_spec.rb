require_relative 'spec_helper'

describe "http" do
  subject{ Eye::Controller.new }

  let(:uri){ URI.parse("http://127.0.0.1:#{PORT}/") }
  let(:uri2){ URI.parse("http://127.0.0.1:#{PORT+1}/") }

  it "load config with http enable" do
    expect{ Net::HTTP.get(uri) }.to raise_error(Errno::ECONNREFUSED)

    subject.load2(fixture("http1.eye"))
    Net::HTTP.get(uri).should == Eye::ABOUT
  end

  it "load config with http enable then disable" do
    subject.load2(fixture("http1.eye"))
    Net::HTTP.get(uri).should == Eye::ABOUT

    subject.load2(fixture("http2.eye"))
    expect{ Net::HTTP.get(uri) }.to raise_error(Errno::ECONNREFUSED)
  end

  it "load config with http enable then change port" do
    subject.load2(fixture("http1.eye"))
    Net::HTTP.get(uri).should == Eye::ABOUT

    subject.load2(fixture("http3.eye"))
    expect{ Net::HTTP.get(uri) }.to raise_error(Errno::ECONNREFUSED)
    Net::HTTP.get(uri2).should == Eye::ABOUT
  end

  it "should not reconnect when load the same config" do
    res = subject.load2(fixture("http1.eye"))
    res.values.map{|c| c[:error]}.should == [false]
    Net::HTTP.get(uri).should == Eye::ABOUT

    dont_allow(subject).stop_http

    res = subject.load2(fixture("http1.eye"))
    res.values.map{|c| c[:error]}.should == [false]
    Net::HTTP.get(uri).should == Eye::ABOUT
  end

  it "load error should catch" do
    res = subject.load2(fixture("http4.eye"))
    res.values.map{|c| c[:error]}.should == [true]
  end
end
