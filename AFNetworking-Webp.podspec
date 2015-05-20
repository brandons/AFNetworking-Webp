Pod::Spec.new do |s|
  s.name          = "AFNetworking-Webp"
  s.version       = "0.1"
  s.summary       = "A Webp image response serializer for AFNetworking 2.0"
  s.homepage      = "https://github.com/brandons/AFNetworking-Webp"
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = { "brandons" => "" }
  s.platform      = :ios, '7.0'
  s.source        = { :git => "https://github.com/brandons/AFNetworking-Webp", :tag => '0.1'}
  s.source_files  = 'Classes', 'AFNetworking-Webp'
  s.requires_arc  = true
  s.dependency 'AFNetworking', '~> 2.2'
end
