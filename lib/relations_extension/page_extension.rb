module RelationsExtension::PageExtension
  def self.included(base)
    base.class_eval do
      has_and_belongs_to_many :related_pages,
                                :class_name => 'Page',
                                :join_table => 'related_pages',
                                :foreign_key => 'page_id',
                                :association_foreign_key => 'related_page_id',
                                :after_add => :add_self_to_related,
                                :after_remove => :remove_self_from_related
                                
      after_create :add_self_to_all_related
    end
  end
  
  protected
  def add_self_to_related(related_page)
    related_page.related_pages << self if (!related_page.related_pages.include?(self) && self.valid?)
  end
  
  def remove_self_from_related(related_page)
    related_page.related_pages.delete(self) if related_page.related_pages.include?(self)
  end
  
  def add_self_to_all_related
    related_pages.each do |rp|
      add_self_to_related rp
    end
  end
end
