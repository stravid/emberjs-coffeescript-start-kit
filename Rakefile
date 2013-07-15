require 'rubygems'
require 'bundler'
 
Bundler.require

require './boot'
 
namespace :assets do
  desc 'compile assets'
  task :compile => [:compile_js, :compile_css, :copy_index] do
  end
 
  desc 'compile javascript assets'
  task :compile_js do
    sprockets = App::ASSETS
    asset     = sprockets['application.js.coffee']
    outpath   = File.join('build', 'assets')
    outfile   = Pathname.new(outpath).join('application.js') # may want to use the digest in the future?
 
    FileUtils.mkdir_p outfile.dirname
 
    asset.write_to(outfile)
    asset.write_to("#{outfile}.gz")
    puts "successfully compiled js assets"
  end
 
  desc 'compile css assets'
  task :compile_css do
    sprockets = App::ASSETS
    asset     = sprockets['application.css.scss']
    outpath   = File.join('build', 'assets')
    outfile   = Pathname.new(outpath).join('application.css') # may want to use the digest in the future?
 
    FileUtils.mkdir_p outfile.dirname
 
    asset.write_to(outfile)
    asset.write_to("#{outfile}.gz")
    puts "successfully compiled css assets"
  end

  desc 'copy index.html to build folder'
  task :copy_index do
    system 'cp ./public/index.html ./build/index.html'
    puts "successfully copied index.html"
  end
  # todo: add :clean_all, :clean_css, :clean_js tasks, invoke before writing new file(s)
end

def alias_task(new, old)
  task new, Rake::Task[old].arg_names => old
end

task :server do
  system "bundle exec rackup -p 3000"
end

alias_task :s, :server