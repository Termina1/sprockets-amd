require 'pry'
class AMDTemplateEngine

  def initialize(code)
    @code = code
  end

  def extract_module_name
    @moodule_name ||= with_prefix(@code.match(/AMD\.module\.([\w_\.-]+)/)[1]).first
  end

  def extract_dependencies
    @deps ||= with_prefix @code.scan(/AMD\.require\.([\w_\.-]+)/).flatten.uniq
  end

  def get_quote_dependencies
    extract_dependencies.map { |el| "'#{el}'" }
  end

  def with_prefix(matches)
    matches = [matches] unless matches.is_a?(Array)
    matches.map do |el| 
      arr = el.split(".") 
      if get_registered_prefixes.include?(arr[0])
        arr.slice(0, 2).join(".")
      else
        arr.slice(0)
      end
    end
  end

  def get_registered_prefixes
    %w(App)
  end

  def module_name_without_prefix
    without_prefix [extract_module_name]
  end  

  def dependencies_without_prefix
    without_prefix extract_dependencies
  end

  def without_prefix(thing)
    prefixes = get_registered_prefixes
    thing.map do |el|
      prefixes.each { |pr| el = el.gsub("#{pr}.", '') }
      el
    end
  end

  def strip_code
    (["AMD.require", "AMD.module"] + get_registered_prefixes).each do |pref|
      @code = @code.gsub "#{pref}.", ''
    end
    @code += "\nreturn #{module_name_without_prefix[0]};"
    @code
  end

  def render
    "define('#{extract_module_name}', [#{get_quote_dependencies.join(', ')}], function(#{dependencies_without_prefix.join(", ")}) {\n#{strip_code}});"
  end

end