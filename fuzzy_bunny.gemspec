# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fuzzy_bunny}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["R. Potter"]
  s.date = %q{2009-07-06}
  s.description = %q{useless client for Amazon's SimpleDB built on aws_sdb_bare and typhoeus}
  s.email = %q{rjspotter@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "fuzzy_bunny.gemspec",
     "lib/fuzzy_bunny.rb",
     "lib/fuzzy_bunny/curry.rb",
     "lib/fuzzy_bunny/domains.rb",
     "lib/fuzzy_bunny/items.rb",
     "lib/fuzzy_bunny/object.rb",
     "test/fuzzy_bunny/test_domains.rb",
     "test/fuzzy_bunny/test_items.rb",
     "test/fuzzy_bunny_test.rb",
     "test/test_fuzzy_bunny.rb",
     "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/rjspotter/fuzzy_bunny}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{useless client for Amazon's SimpleDB built on aws_sdb_bare and typhoeus}
  s.test_files = [
    "test/test_helper.rb",
     "test/fuzzy_bunny_test.rb",
     "test/fuzzy_bunny/test_items.rb",
     "test/fuzzy_bunny/test_domains.rb",
     "test/test_fuzzy_bunny.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<facets>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<hungryblank-aws_sdb_bare>, [">= 0"])
      s.add_runtime_dependency(%q<pauldix-typhoeus>, [">= 0"])
    else
      s.add_dependency(%q<facets>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<hungryblank-aws_sdb_bare>, [">= 0"])
      s.add_dependency(%q<pauldix-typhoeus>, [">= 0"])
    end
  else
    s.add_dependency(%q<facets>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<hungryblank-aws_sdb_bare>, [">= 0"])
    s.add_dependency(%q<pauldix-typhoeus>, [">= 0"])
  end
end
