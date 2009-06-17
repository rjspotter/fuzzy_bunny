require File.join(File.dirname(__FILE__), "/../test_helper")

class TestConfiguration < Test::Unit::TestCase
  
  context "base_uri attribute" do
    
    should "be writable" do
      lambda { FuzzyBunny::Configuration.base_uri = 'example.com'}.should_not raise_error
    end
    
    should "be readable" do
      lambda { FuzzyBunny::Configuration.base_uri}.should_not raise_error
    end
    
    should "be mutable" do
      FuzzyBunny::Configuration.base_uri = 'example.com'
      FuzzyBunny::Configuration.base_uri.should == 'example.com'
    end
    
    should "be singleton" do
      FuzzyBunny::Configuration.new.base_uri = 'example.com'
      FuzzyBunny::Configuration.new.base_uri.should == 'example.com'
    end
    
  end
  
  context "account attribute" do
    
    should "be writable" do
      lambda { FuzzyBunny::Configuration.account = 'example.com'}.should_not raise_error
    end
    
    should "be readable" do
      lambda { FuzzyBunny::Configuration.account}.should_not raise_error
    end
    
    should "be mutable" do
      FuzzyBunny::Configuration.account = 'example.com'
      FuzzyBunny::Configuration.account.should == 'example.com'
    end
    
    should "be singleton" do
      FuzzyBunny::Configuration.new.account = 'example.com'
      FuzzyBunny::Configuration.new.account.should == 'example.com'
    end
    
  end
  
  context "secret attribute" do
    
    should "be writable" do
      lambda { FuzzyBunny::Configuration.secret = 'example.com'}.should_not raise_error
    end
    
    should "be readable" do
      lambda { FuzzyBunny::Configuration.secret}.should_not raise_error
    end
    
    should "be mutable" do
      FuzzyBunny::Configuration.secret = 'example.com'
      FuzzyBunny::Configuration.secret.should == 'example.com'
    end
    
    should "be singleton" do
      FuzzyBunny::Configuration.new.secret = 'example.com'
      FuzzyBunny::Configuration.new.secret.should == 'example.com'
    end
    
  end
  
  context "mass assignment from hash" do
    
    
    should "set initial values" do
      FuzzyBunny::Configuration.from_hash({:account => '1234', :secret => 'asdf', :base_uri => 'example.com'})
      [FuzzyBunny::Configuration.account, FuzzyBunny::Configuration.secret, FuzzyBunny::Configuration.base_uri].should == ['1234', 'asdf', 'example.com']
    end
    
    should "modify_values" do
      FuzzyBunny::Configuration.from_hash({:account => '1234', :secret => 'asdf', :base_uri => 'example.com'})
      FuzzyBunny::Configuration.from_hash({:account => '12345'})
      [FuzzyBunny::Configuration.account, FuzzyBunny::Configuration.secret, FuzzyBunny::Configuration.base_uri].should == ['12345', 'asdf', 'example.com']
    end
    
  end
  
  should "to_hash" do
    FuzzyBunny::Configuration.from_hash({:account => '1234', :secret => 'asdf', :base_uri => 'example.com'})
    FuzzyBunny::Configuration.to_hash.should == {:account => '1234', :secret => 'asdf', :base_uri => 'example.com'}
  end
  
end