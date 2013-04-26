require 'spec_helper'

describe AMDTemplateEngine do
  let(:file_class) { File.read("spec/fixtures/test_class.js") }
  let(:processed_file_class) { File.read("spec/fixtures/processed_test_class.js") }
  let(:processed_file_fun) { File.read("spec/fixtures/processed_test_fun.js") }
  let(:file_fun) { File.read("spec/fixtures/test_fun.js") }

  it "extract module name" do
    expect(AMDTemplateEngine.new(file_class, ["App"]).extract_module_name).to eq("App.ResumeLandingWindow")
    expect(AMDTemplateEngine.new(file_fun, ["App"]).extract_module_name).to eq("App.WindowHeightAdjustable")
  end

  it "extracts all deps" do
    expect(AMDTemplateEngine.new(file_class, ["App"]).extract_dependencies).to eql ["machina", "App.BaseController"]
  end

  it "renders ready code" do
    expect(processed_file_class).to eql AMDTemplateEngine.new(file_class, ["App"]).render
    expect(processed_file_fun).to eql AMDTemplateEngine.new(file_fun, ["App"]).render
  end

end