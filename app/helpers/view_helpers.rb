module SprocketsAmd
  module ViewHelpers

    def javascript_require(*manifest)
      manifest = manifest.reduce({}) do |acc, el| 
        acc[el] = Rails.application.assets[el].digest_path
        acc
      end
      raw "<script type=\"text/javascript\">
        require.config({paths: #{manifest.to_json}});
      </script>\n"
    end

    def javascript_include_tag_amd(*manifest)
      content = javascript_include_tag *manifest
      definitions = manifest.reduce("") do |acc, el|
        acc + "define('#{el}', function() {});\n"
      end
      content + raw("<script type=\"text/javascript\">#{definitions}</script>")
    end

  end
end

