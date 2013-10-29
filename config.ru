require 'sprockets'

class EmberHandlebars < Tilt::Template
  self.default_mime_type = 'application/javascript'

  def prepare
  end

  def evaluate(scope, locals, &block)
    <<-OUTPUT
(function() {
  Ember.TEMPLATES || (Ember.TEMPLATES = {});
  Ember.TEMPLATES['#{scope.logical_path.gsub(/^templates\/(.*)$/i, "\\1")}'] = Handlebars.template("#{data.gsub(/$(.)/m, "\\1  ").strip}");
}).call(this);
    OUTPUT
  end
end

project_root = File.expand_path(File.dirname(__FILE__))
assets = Sprockets::Environment.new(project_root) do |env|
  env.logger = Logger.new(STDOUT)
end

assets.register_engine('.hbs', EmberHandlebars)
assets.register_engine('.handlebars', EmberHandlebars)
assets.register_engine('.hjs', EmberHandlebars)

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
