# frozen_string_literal: true

require 'k8r/version'
require 'pathname'

module Rubyists
  # Library Namespace and Core Module
  module K8r
    class Error < StandardError; end
    ROOT       = Pathname.new(__FILE__).dirname.expand_path.join('..').expand_path
    MODEL_ROOT = ROOT.join('model')
    LIBROOT    = ROOT.join('lib/k8r')

    # rubocop:disable Naming/MethodName
    def self.R(ruby)
      require ROOT.join(ruby).to_s
    end

    def self.L(lib)
      require LIBROOT.join(lib).to_s
    end

    def self.M(model)
      require MODEL_ROOT.join(model).to_s
    end
    # rubocop:enable Naming/MethodName
  end
end
