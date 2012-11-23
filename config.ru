require 'sprockets'
require 'handlebars_assets'

project_root = File.expand_path(File.dirname(__FILE__))
assets = Sprockets::Environment.new(project_root) do |env|
  env.logger = Logger.new(STDOUT)
end

HandlebarsAssets::Config.template_namespace = 'Ember.TEMPLATES'

assets.append_path HandlebarsAssets.path

assets.append_path(File.join(project_root, 'app', 'assets', 'javascripts'))
assets.append_path(File.join(project_root, 'app', 'assets', 'stylesheets'))

assets.append_path(File.join(project_root, 'vendor', 'assets', 'javascripts'))
assets.append_path(File.join(project_root, 'vendor', 'assets', 'stylesheets'))

map "/assets" do
  run assets
end

map "/" do
  run lambda { |env|
    [
      200,
      {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('public/index.html', File::RDONLY)
    ]
  }
end
