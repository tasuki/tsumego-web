# Middleman config file

require_relative 'lib/smart_quotes'

# Settings
activate :directory_indexes

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Helpers
helpers do
	def nav_active(page)
		(page_classes().split(" ").include?(page)) ? {:class => "active"} : {}
	end
end

# Apply typography once, after the complete HTML layout (including partials)
# has rendered. Markdown's existing smart quotes are left unchanged.
app.after_render do |html, path|
	SmartQuotes.render(html) if path.end_with?('layouts/layout.haml')
end

# Build-specific configuration
configure :build do
	activate :minify_css
end
