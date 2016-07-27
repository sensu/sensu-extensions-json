require File.join(File.dirname(__FILE__), "helpers")
require "sensu/extensions/json"

describe "Sensu::Extension::Json" do
  include Helpers

  before do
    @extension = Sensu::Extension::Json.new
  end

  it "can run, returning json formatted event data" do
    event = event_template
    @extension.safe_run(event) do |output, status|
      expect(output).to eq(Sensu::JSON.dump(event))
      expect(status).to eq(0)
    end
  end
end
