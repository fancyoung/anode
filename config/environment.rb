# Load the rails application
require File.expand_path('../application', __FILE__)

customize_config = File.join(Rails.root, 'config', 'customize_config.rb')
load(customize_config) if File.exists?(customize_config)

# Initialize the rails application
Anode::Application.initialize!
