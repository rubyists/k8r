# frozen_string_literal: true

require 'fileutils'

module Rubyists
  # The main library namespace
  module K8r
    L 'utils/process'
    # The utility namespace
    module Utils
      SPEC_PATH = Pathname("/tmp/k8r_spec_#{Process.pid}")
      RSpec.describe Subprocess do
        # subject(:subprocess) { Subprocess }
        before(:all) { FileUtils.mkdir_p(SPEC_PATH.join('foo')) }
        after(:all) { FileUtils.rm_f SPEC_PATH }

        it 'Should run ls and return stdout as the first block variable' do
          outs, errs = [], [] # rubocop:disable Style/ParallelAssignment
          thread = subject.threaded_run('ls', SPEC_PATH.to_s) do |stdout, stderr|
            outs << stdout if stdout
            errs << stderr if stderr
          end
          expect(thread.value).not_to be_nil
          expect(thread.value.to_i).to eq(0)
          expect(errs.size).to eq(0)
          expect(outs.size).to eq(1)
          expect(outs.first.chomp).to eq('foo')
        end
      end
    end
  end
end
