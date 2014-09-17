require "bundler/gem_tasks"

rule /^version:bump:.*/ do |t|
  index                       = ['major', 'minor','patch'].index(t.name.split(':').last)
  file                        = 'lib/eye-userenv/version.rb'
  version_file                = File.read(file)
  old_version, *version_parts = version_file.match(/(\d+)\.(\d+)\.(\d+)/).to_a
  version_parts[index]        = version_parts[index].to_i + 1
  version_parts[2]            = 0 if index < 2
  version_parts[1]            = 0 if index < 1
  new_version                 = version_parts * '.'

  sh "git status | grep 'nothing to commit'" # ensure we are not dirty

  File.open(file,'w') do |f|
    f.write(version_file.sub(old_version, new_version))
  end

  sh "rake install &&
      git add #{file} Gemfile.lock &&
      git commit -m 'Bump version from #{old_version} to #{new_version}' &&
      git push &&
      rake release"
end

desc "Show current version"
task :version do
  require 'eye-userenv'

  puts "Current version of eye-userenv is: #{Eye::Userenv::VERSION}"
end
