require File.join(File.dirname(__FILE__), "/../test_helper")

class TestClient < Test::Unit::TestCase
  
  context "domains" do
    
    setup do
      FuzzyBunny::Configuration.from_hash({:account => '1234', :secret => 'asdf', :base_uri => 'http://localhost:8080'})
    end
      
    context "create" do
      
      should "not raise" do
        lambda {FuzzyBunny::Client.create_domain('nome')}.should_not raise_error
      end
      
      should "create domain" do
        FuzzyBunny::Client.create_domain('nome')
        FuzzyBunny::Client.list_domains.should include('nome')
      end
      
    end
    
    context "list" do
      
      should "not raise" do
        lambda {FuzzyBunny::Client.list_domains}.should_not raise_error
      end
      
    end
    
    context "delete" do
      
      should "not raise" do
        lambda {FuzzyBunny::Client.delete_domain('nome')}.should_not raise_error
      end
      
      should "delete domain" do
        FuzzyBunny::Client.delete_domain('nome')
        FuzzyBunny::Client.list_domains.should_not include('nome')
      end
      
    end
    
    context "metadata" do
      
      should "not raise" do
        lambda {FuzzyBunny::Client.domain_metadata('nome')}.should_not raise_error
      end
      
    end
    
  end
  
  
end