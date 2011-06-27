module RelationsExtension::RelationsTags
  include Radiant::Taggable

  desc %{
    
  }
  tag 'related_pages' do |tag|
    tag.expand
  end
  tag 'related_pages:each' do |tag|
    related_pages = tag.locals.page.related_pages
    
    related_pages.inject('') do |result, related_page|
      tag.locals.page = related_page
      result + tag.expand
    end
  end
end