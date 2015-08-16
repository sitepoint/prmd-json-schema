Dir["./spec/support/**/*.rb"].each { |f| require f }
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # Use only the expect syntax
    expectations.syntax = :expect

    # Output description of chained matchers
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents from mocking a method that does not exist on a real object
    mocks.verify_partial_doubles = true
  end

  # Limits the available syntax to the non-monkey patched syntax
  config.disable_monkey_patching!
  config.expose_dsl_globally = false

  # Allow more verbose output when running an individual spec file
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output
    config.default_formatter = "doc"
  end

  # Print the 5 slowest examples and example groups
  config.profile_examples = 5

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option
  Kernel.srand config.seed
end
