# -*- encoding: utf-8 -*-
# stub: photoswipe-rails 4.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "photoswipe-rails"
  s.version = "4.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kristaps Karlsons", "Dmitry Semenov"]
  s.date = "2015-07-13"
  s.description = "A gem to add PhotoSwipe to Rails asset pipeline"
  s.email = ["kristaps.karlsons@gmail.com", "diiiimaaaa@gmail.com"]
  s.homepage = "https://github.com/skakri/photoswipe-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Adds PhotoSwipe to your Rails asset pipeline"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, ["~> 10"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, ["~> 10"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, ["~> 10"])
  end
end
