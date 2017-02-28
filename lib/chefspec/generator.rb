require 'chefspec/generator/version'
require 'fileutils'

module Chefspec
  class Generator
    def initialize(config)
      @config = config
    end

    def cookbook_root
      @config[:cookbook_root] || raise
    end

    def build_spec_dir
      spec_dir = File.join(cookbook_root, 'spec')
      FileUtils.mkdir_p(spec_dir)

      # copy spec helper fixture to root of spec dir
      FileUtils.cp(
        File.join(File.dirname(__FILE__), 'fixtures', 'spec_helper.rb'),
        spec_dir
      )

      # common directories to spec
      %w(recipes libraries resources).each do |dirname|
        Dir[File.join(cookbook_root, dirname, '*.rb')].each do |rb_file|
          # create directory for spec files
          FileUtils.mkdir_p(File.join(spec_dir, dirname))

          # copy spec skeleton file
          spec_file = File.join(
            cookbook_root,
            dirname,
            "#{File.basename(rb_file, '.rb')}_spec.rb"
          )
          FileUtils.cp(
            File.join(File.dirname(__FILE__), 'fixtures', 'spec_skeleton.rb'),
            spec_file
          )
        end
      end
    end
  end
end
