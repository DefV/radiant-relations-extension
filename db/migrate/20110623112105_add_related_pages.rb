class AddRelatedPages < ActiveRecord::Migration
  def self.up
    create_table :related_pages, :id => false do |t|
      t.belongs_to :page
      t.belongs_to :related_page
    end
  end

  def self.down
    drop_table :related_pages
  end
end