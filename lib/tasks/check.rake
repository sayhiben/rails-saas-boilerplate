# frozen_string_literal: true
task :rubocop do
  sh 'rubocop -D -E'
end

task :check do
  Rake::Task['test'].invoke
  Rake::Task['brakeman'].invoke
  Rake::Task['rails_best_practices'].invoke
  Rake::Task['rubocop'].invoke
end
