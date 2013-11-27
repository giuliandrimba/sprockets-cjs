require 'sprockets/cjs'

if defined?(Rails)
  module Sprockets
    class CJS

      class Engine < ::Rails::Engine
        initializer :setup_commonjs, :after => "sprockets.environment", :group => :all do |app|
          app.assets.register_postprocessor 'application/javascript', CJS
        end
      end

    end
  end
end
