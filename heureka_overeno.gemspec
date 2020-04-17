lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'heureka_overeno'
  s.version       = '0.0.1'
  s.authors       = ['Sinfin']
  s.email         = ['martin.dedek@sinfin.cz']
  s.homepage      = 'http://sinfin.digital'
  s.summary       = 'Heureka Ověřeno zákazníky (ShopCertification) service API ruby wrapper'
  s.description   = 'Heureka Ověřeno zákazníky (ShopCertification) service API ruby wrapper'
  s.license       = 'MIT'
  s.files         = Dir[ 'lib/**/*' ]
  s.require_paths = [ 'lib' ]

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'pry'
end
