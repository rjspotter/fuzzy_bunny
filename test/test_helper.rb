require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'matchy'

ENV['AMAZON_ACCESS_KEY_ID'] = <your id>
ENV['AMAZON_SECRET_ACCESS_KEY'] = <your secret>
ENV['AMAZON_SDB_HOST'] = 'http://sdb.amazonaws.com'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'fuzzy_bunny'

class Test::Unit::TestCase
end

def_matcher :be_true do |receiver, matcher, args|
  !!receiver
end