module SprocketsAmd
  module ViewHelpers

    def javascript_require(manifest)
      raw "<script type=\"text/javascript\">
        require.config({paths: {#{manifest}: '#{asset_path(manifest)}'}});
      </script>"
    end

  end
end

