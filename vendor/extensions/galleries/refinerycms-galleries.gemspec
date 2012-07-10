# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-galleries'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Galleries extension for Refinery CMS'
  s.date              = '2012-03-31'
  s.summary           = 'Galleries extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.2'
  s.add_dependency             "picasa", "~> 0.3.0"

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.2'
end
