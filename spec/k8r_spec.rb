# frozen_string_literal: true

# Global namespace
module Rubyists
  RSpec.describe K8r do
    it 'has a version number' do
      expect(K8r::VERSION).not_to be nil
    end

    it 'can load libraries' do
      expect { subject.L 'version' }.not_to raise_error
    end
  end
end
