require 'facets/string/camelcase'
module FuzzyBunny
  class Items
    
    include Typhoeus
    
    remote_defaults :on_success => lambda {|response| AwsSdb::Response.parse(response.body)},
                        :on_failure => lambda {|response| puts "error code: #{response.code} \n #{response.body}"},
                        :base_uri   => ENV['AMAZON_SDB_HOST']
    
    define_remote_method :query, :path => '/?:query_string'
    
    def self.generate(domain)
      eval("::#{domain.camelcase(true)} = build_class('#{domain}')")
    end
    
    def self.build_class(domain)
      Class.new do |klass|
        klass.__send__(:define_class_method, :update, FuzzyBunny::Items.put_attributes(domain))
        klass.__send__(:define_class_method, :find, FuzzyBunny::Items.mass_select_attributes(domain))
        klass.__send__(:define_class_method, :splat, FuzzyBunny::Items.select_splat_from(domain))
        klass.__send__(:define_class_method, :destroy, FuzzyBunny::Items.delete_item_from(domain))
      end
    end
    
    def self.put_attributes(domain)
      lambda do |d,n,a| 
        query({
          :query_string => AwsSdb::Request::PutAttributes.new({
            :domain => d, 
            :name => n, 
            :attributes => a
          }).uri_query
        })
      end.curry.call(domain)
    end
    
    def self.select_splat_from(domain)
      lambda do |d,c|
        query({
          :query_string => AwsSdb::Request::Select.new({
            :query => "SELECT * FROM #{d} where #{c}"
          }).uri_query
        })
      end.curry.call(domain)
    end
    
    def self.mass_select_attributes(domain)
      lambda do |d,uuids|
        uuids = [uuids].flatten
        query({
          :query_string => AwsSdb::Request::Select.new({
            :query => "SELECT * FROM #{d} where #{uuids.map {|u| " itemName() = '#{u}' "}.join('or')}"
          }).uri_query
        })
      end.curry.call(domain)
    end
    
    def self.delete_item_from(domain)
      lambda do |d,uuid|
        query({
          :query_string => AwsSdb::Request::DeleteAttributes.new({
            :domain => d, 
            :name => uuid
          }).uri_query
        })
      end.curry.call(domain)
    end
    
  end

end