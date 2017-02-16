require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet_blacksmith/rake_tasks'

PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]

task :test => [:lint, :validate, :spec]
