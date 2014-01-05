require 'sprockets'
require 'tilt'

module Sprockets
  class CJS < Tilt::Template

    WRAPPER = '%s.define({"%s":' +
              'function(exports, require, module){' +
              '%s' +
              ";}});\n"

    class << self
      attr_accessor :default_namespace
    end

    self.default_mime_type = 'application/javascript'
    self.default_namespace = 'this.require'

    protected

    def prepare
      @namespace = self.class.default_namespace
    end

    def evaluate(scope, locals, &block)
      if !is_cjs_lib?(scope) && commonjs_module?(data)
        scope.require_asset 'sprockets/cjs'
        WRAPPER % [ namespace, commonjs_module_name(scope), data ]
      else
        data
      end
    end

    private

    attr_reader :namespace

    def commonjs_module?(data)
      data.to_s.include?('module.exports')
    end

    def commonjs_module_name(scope)
      scope.logical_path.to_s
    end

    def is_cjs_lib?(scope)
      scope.logical_path.to_s.include?('sprockets/cjs')
    end

  end
end

require 'sprockets/cjs/engine'
