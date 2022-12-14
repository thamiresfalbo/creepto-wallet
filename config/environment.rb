# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

# Initialize the Rails application.
Rails.application.initialize!
