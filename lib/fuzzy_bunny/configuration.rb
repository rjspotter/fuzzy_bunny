module FuzzyBunny
  
  class Configuration
    
    cattr_accessor :base_uri, :account, :secret
    
    def self.from_hash(hsh)
      hsh.each_pair {|k,v| send("#{k}=".to_sym, v)}
    end
    
    def self.to_hash
      [:base_uri, :account, :secret].inject({}) {|m,x| m[x] = send(x) ; m}
    end
    
  end
  
  
end