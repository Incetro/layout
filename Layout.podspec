Pod::Spec.new do |spec|
  spec.name          = 'Layout'
  spec.version       = '0.0.1'
  spec.license       = 'MIT'
  spec.authors       = { 'incetro' => 'incetro@ya.ru', 'Alexander Lezya' => 'Lezya007@gmail.com' }
  spec.homepage      = "https://github.com/Incetro/layout"
  spec.summary       = 'This framework simplifies layout design'
  spec.swift_version = '5.3'

  spec.ios.deployment_target     = "11.0"
  spec.osx.deployment_target     = "10.10"
  spec.watchos.deployment_target = "4.0"
  spec.tvos.deployment_target    = "10.0"

  spec.source        = { git: "https://github.com/Incetro/layout.git", tag: "#{spec.version}" }
  spec.source_files  = "Sources/Layout/**/*.{h,swift}"
end