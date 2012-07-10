module Refinery
  module Guestbooks
    class GuestbooksController < ::ApplicationController

      before_filter :find_all_guestbooks
      before_filter :find_page, :only => [:index]
      before_filter :find_new_page, :only => [:new]

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @guestbook in the line below:
        #present(@page.page(params[:page]))
        @guestbooks = ::Refinery::Guestbooks::Guestbook.page(params[:page])
      end

      def new

        @guestbook = Guestbook.new
      end

      def create
         @guestbook = Guestbook.new(params[:guestbook])

        if @guestbook.save

          redirect_to refinery.guestbooks_guestbooks_path
        else
          render :action => 'new'
        end
      end

      def show
        @guestbook = Guestbook.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @guestbook in the line below:
        present(@page)
      end

    protected

      def find_all_guestbooks
        @guestbooks = ::Refinery::Guestbooks::Guestbook.order('position ASC')
      end

      def find_new_page
        @page = ::Refinery::Page.where(:link_url => "/guestbooks/new").first
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/guestbooks").first
      end

    end
  end
end
