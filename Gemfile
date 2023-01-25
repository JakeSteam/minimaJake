# frozen_string_literal: true

source "https://rubygems.org"
gemspec

gem "jekyll", ENV["JEKYLL_VERSION"] if ENV["JEKYLL_VERSION"] # Does nothing?
gem "kramdown-parser-gfm" if ENV["JEKYLL_VERSION"] == "~> 3.9" # Does nothing?

group :jekyll_plugins do
    gem "jekyll-feed", "~> 0.12"
    gem "jekyll-paginate"
    gem "jekyll-sitemap"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
    gem "tzinfo", "~> 1.2"
    gem "tzinfo-data"
end
  
# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
