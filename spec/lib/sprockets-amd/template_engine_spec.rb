require 'spec_helper'

describe AMDTemplateEngine do
  let(:file_class) { File.read("spec/fixtures/test_class.js") }
  let(:file_fun) { File.read("spec/fixtures/test_fun.js") }

  it "extract module name" do
    expect(AMDTemplateEngine.new(file_class).extract_module_name).to eq("App.ResumeLandingWindow")
    expect(AMDTemplateEngine.new(file_fun).extract_module_name).to eq("App.FindOutFsm")
  end

  it "extracts all deps" do
    expect(AMDTemplateEngine.new(file_class).extract_dependencies).to eql(["App.BaseController", "machina"].to_set)
  end

end