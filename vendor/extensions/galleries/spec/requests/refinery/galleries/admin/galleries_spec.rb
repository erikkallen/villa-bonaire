# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Galleries" do
    describe "Admin" do
      describe "galleries" do
        login_refinery_user

        describe "galleries list" do
          before(:each) do
            FactoryGirl.create(:gallery, :name => "UniqueTitleOne")
            FactoryGirl.create(:gallery, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.galleries_admin_galleries_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.galleries_admin_galleries_path

            click_link "Add New Gallery"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Galleries::Gallery.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Galleries::Gallery.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:gallery, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.galleries_admin_galleries_path

              click_link "Add New Gallery"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Galleries::Gallery.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:gallery, :name => "A name") }

          it "should succeed" do
            visit refinery.galleries_admin_galleries_path

            within ".actions" do
              click_link "Edit this gallery"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:gallery, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.galleries_admin_galleries_path

            click_link "Remove this gallery forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Galleries::Gallery.count.should == 0
          end
        end

      end
    end
  end
end
