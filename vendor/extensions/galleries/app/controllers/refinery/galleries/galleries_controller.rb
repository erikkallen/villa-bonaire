module Refinery
  module Galleries
    class GalleriesController < ::ApplicationController

      before_filter :find_all_galleries
      before_filter :find_page

      def index
        @albums = PhotoAlbum.all
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gallery in the line below:
        present(@page)
      end

      def show
        @album = PhotoAlbum.find_by_id params[:id]
        @photos = @album.photos
        @selected = @photos.select{|p| p.id == params[:selected]}.first || @photos.first
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gallery in the line below:
        present(@page)
      end

    protected

      def find_all_galleries
        @galleries = Gallery.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/galleries").first
      end

    end
  end
end
