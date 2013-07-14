def alias_task(new, old)
  task new, Rake::Task[old].arg_names => old
end

task :server do
  system "bundle exec rackup -p 3000"
end

alias_task :s, :server