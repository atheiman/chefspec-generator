require 'chefspec/generator'
require 'logger'

module Chefspec
  class Generator
    def logger
      return @logger if defined? @_logger
      @logger = Logger.new(STDOUT)
      @logger.level = @config[:log_level] || Logger::INFO
      @logger.progname = self.class.name
      @logger.datetime_format = '%Y-%m-%d %H:%M:%S'
      @logger.formatter = proc do |severity, datetime, progname, msg|
        "[#{progname} #{severity} #{datetime}] #{msg}\n"
      end
      @logger
    end
  end
end
