require 'spec_helper'

config = {
  prefixes: ["App"]
}

describe SprocketsAmd::TemplateEngine do
  let(:file_class) { File.read("spec/fixtures/test_class.js") }
  let(:processed_file_class) { File.read("spec/fixtures/processed_test_class.js") }
  let(:processed_file_fun) { File.read("spec/fixtures/processed_test_fun.js") }
  let(:file_fun) { File.read("spec/fixtures/test_fun.js") }

  it "extract module name" do
    expect(SprocketsAmd::TemplateEngine.new(file_class, config).extract_module_name).to eq("App.ResumeLandingWindow")
    expect(SprocketsAmd::TemplateEngine.new(file_fun, config).extract_module_name).to eq("App.WindowHeightAdjustable")
  end

  it "extracts all deps" do
    expect(SprocketsAmd::TemplateEngine.new(file_class, config).extract_dependencies).to eql ["machina", "App.BaseController"]
  end

  it "renders ready code" do
    expect(processed_file_class).to eql SprocketsAmd::TemplateEngine.new(file_class, config).render
    expect(processed_file_fun).to eql SprocketsAmd::TemplateEngine.new(file_fun, config).render
  end

end