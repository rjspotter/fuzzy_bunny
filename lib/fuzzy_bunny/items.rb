module FuzzyBunny
  class Items
    
    include Typhoeus
    
    remote_defaults :on_success => lambda {|response| AwsSdb::Response.parse(response.body)},
                        :on_failure => lambda {|response| puts "error code: #{response.code} \n #{response.body}"},
                        :base_uri   => 'http://localhost:8080'
    
    define_remote_method :query, :path => '/?:query_string'
    
    def self.put_attributes(domain)
      lambda do |d,n,a| 
        query({
          :query_string => AwsSdb::Request::PutAttributes.new({
            :domain => d, 
            :name => n, 
            :attributes => a
          }, 
          FuzzyBunny::Configuration.to_hash).uri_query
        })
      end.curry[domain]
    end
    
    def self.get_attributes(domain)
      lambda do |d,n,a| 
        query({
          :query_string => AwsSdb::Request::GetAttributes.new({
            :domain => d, 
            :name => n, 
            :attributes => a
          }, 
          FuzzyBunny::Configuration.to_hash).uri_query
        }).attributes
      end.curry[domain]
    end
    
    def self.get_all_attributes(domain)
      lambda do |d,n| 
        query({
          :query_string => AwsSdb::Request::GetAttributes.new({
            :domain => d, 
            :name => n
          }, 
          FuzzyBunny::Configuration.to_hash).uri_query
        }).attributes
      end.curry[domain]
    end
    
    def self.query_of(domain)
      lambda do |d,q| 
        query({
          :query_string => AwsSdb::Request::Query.new({
            :domain => d, 
            :query => q
          }, 
          FuzzyBunny::Configuration.to_hash).uri_query
        }).item_names
      end.curry[domain]
    end
    
    def self.full_query_of(domain)
      lambda do |d,q| 
        query({
          :query_string => AwsSdb::Request::QueryWithAttributes.new({
            :domain => d, 
            :query => q
          }, 
          FuzzyBunny::Configuration.to_hash).uri_query
        })
      end.curry[domain]
    end
    
  end

end