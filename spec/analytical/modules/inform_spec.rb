require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Analytical::Modules::Inform" do
  let(:inform_module) { Analytical::Modules::Inform.new({ :key => 'IN-1234455676' }) }

  describe "on initialize" do
    it "should set the command_location" do
      inform_module.tracking_command_location.should == :head_append
    end

    it 'should set the options' do
      inform_module.options.should == {:key=>'IN-1234455676'}
    end
  end

  describe '#init_javascript' do
    it 'should return the init javascript' do
      inform_module.init_javascript(:head_prepend).should == ''
      inform_module.init_javascript(:head_append).should =~ /IN-1234455676/
      inform_module.init_javascript(:head_append).should =~ /\/\/inform.forwardtechnology.co.uk\/javascripts\/capture.js/
      inform_module.init_javascript(:body_prepend).should == ''
      inform_module.init_javascript(:body_append).should == ''
    end
  end
end
