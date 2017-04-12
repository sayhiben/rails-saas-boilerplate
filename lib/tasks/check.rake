# frozen_string_literal: true
task :rubocop do
  sh 'rubocop -D -E'
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
