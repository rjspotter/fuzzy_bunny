module FuzzyBunny
  
  class Client
    
    include Typhoeus
    
    remote_defaults :on_success => lambda {|response| AwsSdb::Response.parse(response.body)},
                        :on_failure => lambda {|response| puts "error code: #{response.code} \n #{response.body}"},
                        :base_uri   => 'http://localhost:8080'
    
    define_remote_method :query, :path => '/?:query_string'
    
    def self.create_domain(name)
      query({:query_string => AwsSdb::Request::CreateDomain.new({:name => name}, FuzzyBunny::Configuration.to_hash).uri_query})
    end
    
    def self.list_domains(number = nil, token = nil)
      if number && token
        opts = {:max => number, :token => token}
      elsif number
        opts = {:max => number}
      else
        opts = {}
      end
      query({:query_string => AwsSdb::Request::ListDomains.new(opts, FuzzyBunny::Configuration.to_hash).uri_query}).domains
    end
    
    def self.delete_domain(name)
      query({:query_string => AwsSdb::Request::DeleteDomain.new({:name => name}, FuzzyBunny::Configuration.to_hash).uri_query})
    end
    
    def self.domain_metadata(name)
      query({:query_string => AwsSdb::Request::DomainMetadata.new({:name => name}, FuzzyBunny::Configuration.to_hash).uri_query})
    end
    
  end
  
end