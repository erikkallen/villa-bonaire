ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => 'localhost',
  :enable_starttls_auto => false,
#  :domain => 'www.villa-bonaire.nl.com', 
  :port => 25
}