require 'spec_helper'

RSpec.describe Chefspec::Generator do
  @generator = Chefspec::Generator.new(
    cookbook_root: File.join(spec_root, 'test_cookbook')
  )

  before(:all) do
    FileUtils.cp_r(
      File.join(spec_root, 'support/fixtures/test_cookbook'),
      spec_root
    )
  end

  after(:all) do
    FileUtils.rm_rf(File.join(spec_root, 'test_cookbook'))
  end

  it 'has a version number' do
    expect(Chefspec::Generator::VERSION).not_to be nil
  end
end
