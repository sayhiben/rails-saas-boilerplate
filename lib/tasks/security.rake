# frozen_string_literal: true
task :security_check do
  path = File.expand_path('../../../', __FILE__)
  sh "rails_best_practices #{path}"
  sh "brakeman #{path}"
end
