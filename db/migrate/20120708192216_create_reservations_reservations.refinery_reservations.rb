# This migration comes from refinery_reservations (originally 1)
class CreateReservationsReservations < ActiveRecord::Migration

  def up
    create_table :refinery_reservations do |t|
      t.string :name
      t.string :sirname
      t.string :address
      t.string :city
      t.string :email
      t.string :phonenumber
      t.date :startdate
      t.date :enddate
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-reservations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/reservations/reservations"})
    end

    drop_table :refinery_reservations

  end

end
