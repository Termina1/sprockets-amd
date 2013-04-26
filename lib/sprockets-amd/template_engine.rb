class AMDTemplateEngine

  def initialize(code, options = {})
    @prefixes = options[:prefixes]
    @code = code
    @require_statement = options[:require_statement] || "AMD\.require"
    @module_statement = options[:module_statement] || "AMD\.module"
  end

  def extract_module_name
    regexp = /#{@module_statement}\.([\w_\.-]+)/
    @moodule_name ||= with_prefix(@code.match(regexp)[1]).first
  end

  def extract_dependencies
    regexp = /#{@require_statement}\.([\w_\.-]+)/
    @deps ||= with_prefix @code.scan(regexp).flatten.uniq
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
    @prefixes || []
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

  def combined_prefixes
    syntax = [@require_statement, @module_statement]
    prefs = get_registered_prefixes.inject([]) do |sum, pref|
      sum + syntax.map { |el| "#{el}.#{pref}" }
    end
    prefs + syntax
  end

  def strip_code
    @code = "var #{module_name_without_prefix[0]} = {};\n#{@code}"
    combined_prefixes.each do |pref|
      @code = @code.gsub "#{pref}.", ''
    end
    @code += "\nreturn #{module_name_without_prefix[0]};"
    @code
  end

  def render
    "define('#{extract_module_name}', [#{get_quote_dependencies.join(', ')}], function(#{dependencies_without_prefix.join(", ")}) {\n#{strip_code}});"
  end

end