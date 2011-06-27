# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
require 'radiant-relations-extension'

class RelationsExtension < Radiant::Extension
  version RadiantRelationsExtension::VERSION
  description "Adds relations to Radiant."
  url "http://github.com/defv/radiant-relations-extension"
  
  extension_config do |config|
  #  config.gem 'radiant-page_parts-extension'
  #   config.after_initialize do
  #     run_something
  #   end
  end

  # See your config/routes.rb file in this extension to define custom routes
  
  def activate
    admin.page.edit.add :main, 'relations_header_load'
    
    Page.send(:include, RelationsExtension::PageExtension, RelationsExtension::RelationsTags)
    Admin::PagesController.helper :relations
    Admin::PagePartsController.helper :relations
  end
end
