task :check do
  Rake::Task['test'].invoke
  Rake::Task['brakeman'].invoke
  Rake::Task['rails_best_practices'].invoke
end
