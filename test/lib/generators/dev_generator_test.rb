require 'test_helper'
require 'generators/dev/dev_generator'

class DevGeneratorTest < Rails::Generators::TestCase
  tests DevGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
