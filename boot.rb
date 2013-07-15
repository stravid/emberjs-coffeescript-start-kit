require 'rubygems'
require 'bundler'
require 'sprockets'
require 'handlebars_assets'
HandlebarsAssets::Config.ember = true

module App
  project_root = File.expand_path(File.dirname(__FILE__))

  ASSETS = Sprockets::Environment.new(project_root) do |env|
    env.logger = Logger.new(STDOUT)
  end

  ASSETS.append_path HandlebarsAssets.path

  ASSETS.append_path(File.join(project_root, 'app', 'assets', 'javascripts'))
  ASSETS.append_path(File.join(project_root, 'app', 'assets', 'stylesheets'))

  ASSETS.append_path(File.join(project_root, 'vendor', 'assets', 'javascripts'))
  ASSETS.append_path(File.join(project_root, 'vendor', 'assets', 'stylesheets'))
end