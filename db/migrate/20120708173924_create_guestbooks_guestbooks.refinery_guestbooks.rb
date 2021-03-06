# This migration comes from refinery_guestbooks (originally 1)
class CreateGuestbooksGuestbooks < ActiveRecord::Migration

  def up
    create_table :refinery_guestbooks do |t|
      t.string :name
      t.text :message
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-guestbooks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/guestbooks/guestbooks"})
    end

    drop_table :refinery_guestbooks

  end

end
