require "prmd/rake_tasks/combine"
require "prmd/rake_tasks/verify"
require "prmd/rake_tasks/doc"

namespace :schema do
  Prmd::RakeTasks::Combine.new do |t|
    t.options[:meta] = "schema/meta.json"
    # use meta.yml if you prefer YAML format
    t.paths << "schema/schemata"
    t.output_file = "schema/authentication-api.json"
  end

  Prmd::RakeTasks::Verify.new do |t|
    t.files << "schema/authentication-api.json"
  end

  Prmd::RakeTasks::Doc.new do |t|
    t.files = { "schema/authentication-api.json" => "schema/authentication-api.md" }
  end

  task default: ["schema:combine", "schema:verify", "schema:doc"]
end
