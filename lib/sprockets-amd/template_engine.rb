require 'pry'
class AMDTemplateEngine

  def initialize(code)
    @code = code
  end

  def extract_module_name
    with_prefix(@code.match(/AMD\.module\.([\w_\.-]+)/)[1]).first
  end

  def extract_dependencies
    with_prefix @code.scan(/AMD\.require\.([\w_\.-]+)/).flatten
  end

  def with_prefix(matches)
    matches = [matches] unless matches.is_a?(Array)
    map = matches.map do |el| 
      arr = el.split(".") 
      if get_registered_prefixes.include?(arr[0])
        arr.slice(0, 2).join(".")
      else
        arr.slice(0)
      end
    end
    map.to_set
  end

  def get_registered_prefixes
    %w(App)
  end

  def render
    @data
  end

end