require 'rubygems'
require 'nokogiri'
require 'aws_sdb_bare'
require 'typhoeus'

require File.join(File.dirname(__FILE__), "/fuzzy_bunny/curry") unless RUBY_VERSION.to_f >= 1.9
require File.join(File.dirname(__FILE__), "/fuzzy_bunny/object")
require File.join(File.dirname(__FILE__), "/fuzzy_bunny/domains")
require File.join(File.dirname(__FILE__), "/fuzzy_bunny/items")

module FuzzyBunny
  
end