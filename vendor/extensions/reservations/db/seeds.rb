if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms-reservations').blank?
      user.plugins.create(:name => 'refinerycms-reservations',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end


url = "/reservations"
if defined?(::Refinery::Page) 
  unless ::Refinery::Page.where(:link_url => url).empty?
    page = ::Refinery::Page.create(
      :title => 'Reservations',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  else
    page = ::Refinery::Page.where(:link_url => url)
  end
end

unless Refinery::Page.where(:link_url => "#{url}/thank_you").any?
   thank_you_page = page.children.create({
      :title => "Thank You",
      :link_url => "/contact/thank_you",
      :menu_match => "reservations/thank_you",
      :show_in_menu => false,
      :deletable => false
    })
    thank_you_page.parts.create({
      :title => "Body",
      :body => "<p>We've received your reservation and will get back to you with a response shortly.</p><p><a href='/'>Return to the home page</a></p>",
      :position => 0
    })
end

(Refinery::Reservations::Setting.methods.sort - ActiveRecord::Base.methods).each do |setting|
  Refinery::Reservations::Setting.send(setting) unless setting.to_s =~ /=$/
end