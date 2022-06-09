$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name               = "carrierwave_image_validate"
  s.version            = "0.0.1"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dang Thanh Tung"]
  s.date = %q{2022-06-08}
  s.description = %q{A validate image ratio gem for carrierwave}
  s.email = %q{dangthanhtung.open@gmail}
  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]

  s.test_files = ["test/test_carrierwave_image_ratio_validation.rb"]
  s.homepage = %q{http://rubygems.org/gems/carrierwave_image_validate}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{3.2.3}
  s.summary = %q{Image ratio validate!}
  s.license     = 'MIT'

  # add_dependency
  # s.add_development_dependency 'combustion', "~> 1.3"
  # s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
  # s.add_dependency(%q<activerecord>.freeze, [">= 0"])
  # s.add_dependency(%q<rspec>.freeze, [">= 0"])
  # s.add_dependency(%q<activemodel>.freeze, [">= 3.0.0"])
  %w[activemodel activerecord activesupport].each { |rails_subcomponent| s.add_dependency rails_subcomponent, '~> 7.0.0' }

  s.add_development_dependency 'combustion'
  s.add_development_dependency 'mini_magick', ">= 4.9.5"
  s.add_development_dependency 'ruby-vips', ">= 2.1.0"
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'marcel'
  s.add_development_dependency 'carrierwave'
  s.add_development_dependency 'rmagick'
end
