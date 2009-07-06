require File.join(File.dirname(__FILE__), "/../test_helper")

class TestItems < Test::Unit::TestCase
  
  context 'generate domain classes' do
    
    setup do 
      FuzzyBunny::Domains.create('dynamic_domain')
    end
    
    teardown do
      FuzzyBunny::Domains.delete('dynamic_domain')
    end
    
    should "define DynamicDomain" do
      FuzzyBunny::Items.generate('dynamic_domain')
      defined?(DynamicDomain).should be_true
    end
    
    context 'DynamicDomain the generated class' do
      
      setup {FuzzyBunny::Items.generate('dynamic_domain')}
      teardown {Object.send(:remove_const, :DynamicDomain)}
      
      should "be a class" do
        DynamicDomain.class.should == Class
      end
      
      should "respond do cruddy methods" do
        %w[splat update find destroy].each do |m|
          DynamicDomain.respond_to?(m.to_sym).should be_true
        end
      end
      
    end
  end
  
  context 'update' do
    
    setup do
      FuzzyBunny::Domains.delete('dynamic_domain')
      sleep 1
      FuzzyBunny::Domains.create('dynamic_domain')
      FuzzyBunny::Items.generate('dynamic_domain')
      @sample_hash = {'given' => 'Randall', 'family' => 'Potter', 'middle' => 'Jay'}
    end
    
    teardown do
      Object.send(:remove_const, :DynamicDomain)
    end
    
    should 'set data' do
      DynamicDomain.update('foo', @sample_hash)
      response_hash = DynamicDomain.find('foo').items['foo']
      response_hash['given'][0].should == 'Randall'
    end
    
    should 'add data' do
      DynamicDomain.update('foo', @sample_hash)
      DynamicDomain.update('foo', {'middle' => 'Stephen'})
      response_hash = DynamicDomain.find('foo').items['foo']
      response_hash['middle'][1].should == 'Stephen'
    end
    
    should 'overwrite data' do
      DynamicDomain.update('foo', @sample_hash)
      DynamicDomain.update('foo', {'middle' => {:value => 'Stephen', :replace => true}})
      response_hash = DynamicDomain.find('foo').items['foo']
      response_hash['middle'][0].should == 'Stephen'
    end
    
  end
  
  context 'destroy' do
    setup do
      FuzzyBunny::Domains.delete('dynamic_domain')
      sleep 1
      FuzzyBunny::Domains.create('dynamic_domain')
      FuzzyBunny::Items.generate('dynamic_domain')
      @sample_hash = {'given' => 'Randall', 'family' => 'Potter', 'middle' => 'Jay'}
    end
    
    teardown do
      Object.send(:remove_const, :DynamicDomain)
    end
    
    should 'remove record' do
      DynamicDomain.update('foo', @sample_hash)
      DynamicDomain.destroy('foo')
      sleep 2
      DynamicDomain.find('foo').items.should be_empty
    end
    
  end
  
  context 'splat' do
    setup do
      FuzzyBunny::Domains.delete('dynamic_domain')
      sleep 1
      FuzzyBunny::Domains.create('dynamic_domain')
      FuzzyBunny::Items.generate('dynamic_domain')
      @sample_hash = {'given' => 'Randall', 'family' => 'Potter', 'middle' => 'Jay'}
    end
    
    teardown do
      Object.send(:remove_const, :DynamicDomain)
    end
    
    should 'return document' do
      DynamicDomain.update('foo', @sample_hash)
      response_hash = DynamicDomain.splat("`family` = 'Potter'").items['foo']
      response_hash['given'][0].should == 'Randall'
    end
  end
  
  
  
end