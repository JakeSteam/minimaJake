# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name     = "minimaJake"
  spec.version  = "1.0.5"
  spec.authors  = ["Jake Lee"]
  spec.email    = ["minima@jakelee.co.uk"]

  spec.summary  = "Minima, but with the missing functionality added"
  spec.homepage = "https://github.com/JakeSteam/minimaJake"
  spec.license  = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets|_(includes|layouts|sass)/|(LICENSE|README)((\.(txt|md|markdown)|$)))!i)
  end

  spec.add_runtime_dependency "jekyll", ">= 3.5", "< 5.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.12"
end
