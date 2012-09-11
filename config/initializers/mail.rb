ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.smtp_settings = { 
  :address => 'localhost', 
  :domain => 'www.villa-bonaire.nl.com', 
  :port => 25 
} 