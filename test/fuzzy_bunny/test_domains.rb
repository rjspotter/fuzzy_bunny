require File.join(File.dirname(__FILE__), "/../test_helper")

class TestDomains < Test::Unit::TestCase
  
  
  setup do
    FuzzyBunny::Configuration.from_hash({:account => '1234', :secret => 'asdf', :base_uri => 'http://localhost:8080'})
  end
    
  context "create" do
    
    should "not raise" do
      lambda {FuzzyBunny::Domains.create('nome')}.should_not raise_error
    end
    
    should "create domain" do
      FuzzyBunny::Domains.create('nome')
      FuzzyBunny::Domains.list.should include('nome')
    end
    
  end
  
  context "list" do
    
    should "not raise" do
      lambda {FuzzyBunny::Domains.list}.should_not raise_error
    end
    
  end
  
  context "delete" do
    
    should "not raise" do
      lambda {FuzzyBunny::Domains.delete('nome')}.should_not raise_error
    end
    
    should "delete domain" do
      FuzzyBunny::Domains.delete('nome')
      FuzzyBunny::Domains.list.should_not include('nome')
    end
    
  end
  
  context "metadata" do
    
    should "not raise" do
      lambda {FuzzyBunny::Domains.metadata_for('nome')}.should_not raise_error
    end
    
  end
  
end