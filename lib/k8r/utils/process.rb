# frozen_string_literal: true

require 'open3'

module Rubyists
  module K8r
    module Utils
      # Module focused in running processes
      module Subprocess
        def self.threaded_run(*cmd, &_block)
          Open3.popen3(*cmd) do |_stdin, stdout, stderr, thread|
            # read streams in threads
            { out: stdout, err: stderr }.each do |key, stream|
              Thread.new do
                until (line = stream.gets).nil?
                  yield(*(key == :out ? [line, nil] : [nil, line])) if block_given?
                end
              end
            end
            thread.join # Return the thread after it terminates
          end
        end
      end
    end
  end
end
