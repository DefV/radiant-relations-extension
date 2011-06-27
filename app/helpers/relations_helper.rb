module RelationsHelper
  def relation_options(selected = nil)
    options = []
    options << [t('support.select.prompt'), nil]
    Page.all.each do |p| 
      options << [p.title, p.id]
    end
    
    options_for_select(options, selected)
  end
end