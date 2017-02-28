require 'chefspec'
require 'chefspec/berkshelf'

current_dir = File.dirname(File.expand_path(__FILE__))

Dir[File.join(File.dirname(current_dir), 'libraries/**/*.rb')].sort.each { |f| require f }
Dir[File.join(current_dir, 'support/**/*.rb')].sort.each { |f| require f }

RSpec.configure do |config|
  # https://github.com/customink/fauxhai/tree/master/lib/fauxhai/platforms
  config.platform = 'centos'
  config.version = '7.3.1611'

  config.log_level = :error
end

at_exit { ChefSpec::Coverage.report! }
