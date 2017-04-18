# frozen_string_literal: true
task :rubocop do
  sh 'rubocop -D -E'
end

# Exclude feature tests since we don't want to run them on CI servers due to maintenance nightmares
task :ci_rspec do
  sh 'bundle exec rspec --exclude-pattern "spec/features/**/*_spec.rb"'
end

task :rspec do
  sh 'bundle exec rspec'
end

task :check do
  Rake::Task['rspec'].invoke
  Rake::Task['brakeman'].invoke
  Rake::Task['rails_best_practices'].invoke
  Rake::Task['rubocop'].invoke
end

# Travis CI runs this
task :ci_check do
  Rake::Task['ci_rspec'].invoke
  Rake::Task['brakeman'].invoke
  Rake::Task['rails_best_practices'].invoke
  Rake::Task['rubocop'].invoke
end
