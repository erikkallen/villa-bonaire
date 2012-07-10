# This migration comes from refinery_galleries (originally 1)
class CreateGalleriesGalleries < ActiveRecord::Migration

  def up
    create_table :refinery_galleries do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-galleries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/galleries/galleries"})
    end

    drop_table :refinery_galleries

  end

end
