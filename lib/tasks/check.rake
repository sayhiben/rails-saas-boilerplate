# frozen_string_literal: true
task :rubocop do
  sh 'rubocop -D -E'
end

task :rspec do
  # Exclude feature tests since we don't want to run them on CI servers due to maintenance nightmares
  sh 'bundle exec rspec --exclude-pattern "spec/features/**/*_spec.rb"'
end

task :check do
  Rake::Task['rspec'].invoke
  Rake::Task['brakeman'].invoke
  Rake::Task['rails_best_practices'].invoke
  Rake::Task['rubocop'].invoke
end
