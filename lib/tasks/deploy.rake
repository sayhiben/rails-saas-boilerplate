task :deploy do
  Rake::Task['check'].invoke
  sh 'git push origin heroku'
end
