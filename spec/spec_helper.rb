# frozen_string_literal: true

require "yard-solargraph"

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

class TestTextTemplateOptions < YARD::Templates::TemplateOptions
  default_attr :markup, :none
  default_attr :default_return, ""
  default_attr :format, :text
  default_attr :highlight, false
end

def text_template_options
  TestTextTemplateOptions.new.tap(&:reset_defaults)
end
