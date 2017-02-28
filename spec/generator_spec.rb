require 'spec_helper'

RSpec.describe Chefspec::Generator do
  @generator = Chefspec::Generator.new(
    cookbook_root: File.join(File.dirname(__FILE__), 'test_cookbook')
  )
  @src_cookbook = File.join(File.dirname(__FILE__), 'test_cookbook')

  before(:all) do
    current_dir = File.dirname(__FILE__)
    FileUtils.rm_rf(File.join(current_dir, 'test_cookbook'))
    FileUtils.cp_r(
      File.join(current_dir, 'support/fixtures/test_cookbook'),
      current_dir
    )
  end

  it 'has a version number' do
    expect(Chefspec::Generator::VERSION).not_to be nil
  end
end
