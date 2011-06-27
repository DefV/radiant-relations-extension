class RelationPagePart < PagePart
  part_name "Relations"
  before_save :update_related_pages

  attr_accessor :related_page_ids
  
  def related_page_ids=(ids)
    changed_attributes[:related_page_ids] = @related_page_ids
    @related_page_ids = ids
  end
  
  private
  def update_related_pages
    page.related_page_ids = related_page_ids.compact
  end
end