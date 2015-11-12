Gem::Specification.new do |s|
  s.name = 'xws'
  s.version = '0.1.0'
  s.summary = 'XML Word Scanner (XWS) reads a Rexle document and returns a hash object containing each word found.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/xws.rb']
  s.add_runtime_dependency('rexle', '~> 1.3', '>=1.3.9')
  s.signing_key = '../privatekeys/xws.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/xws'
end
