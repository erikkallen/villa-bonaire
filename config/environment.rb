# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
VillaBonaireNext::Application.initialize!

Time::DATE_FORMATS[:dutch] = "%d-%m-%Y"