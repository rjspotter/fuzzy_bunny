require File.join(File.dirname(__FILE__), "/../test_helper")

class TestItems < Test::Unit::TestCase
  
  context "put_attributes" do
    
    setup do
      FuzzyBunny::Configuration.from_hash({:account => '1234', :secret => 'asdf', :base_uri => 'http://localhost:8080'})
      FuzzyBunny::Domains.create('mon')
      @mons = FuzzyBunny::Items.put_attributes('mon')
    end
    
    teardown do
      FuzzyBunny::Domains.delete('mon')
    end
    
    should "not raise" do
      lambda {@mons['onefish'][{:color => 'red'}] }.should_not raise_error
    end
    
  end
  
  context "get_all_attributes" do
    
    setup do
      FuzzyBunny::Configuration.from_hash({:account => '1234', :secret => 'asdf', :base_uri => 'http://localhost:8080'})
      FuzzyBunny::Domains.create('mon')
      @mons = FuzzyBunny::Items.get_all_attributes('mon')
      @put_mon = FuzzyBunny::Items.put_attributes('mon')
    end
    
    teardown do
      FuzzyBunny::Domains.delete('mon')
    end
    
    should "equal put attributes earlier" do
      @put_mon['onefish'][{:color => 'red'}] 
      @mons['onefish'].should == {'color' => ['red']}
    end
    
  end
  
end