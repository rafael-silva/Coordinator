Pod::Spec.new do |s|
  s.name             = 'Coordinator'
  s.version          = '0.1.1'
  s.summary          = 'A short description of Coordinator.'

  s.description      = 'description'

  s.homepage         = 'https://github.com/rafael-silva/Coordinator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rafael-silva' => 'rafael.matos@involves.com.br' }
  s.source           = { :git => 'https://github.com/rafael-silva/Coordinator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5'

  s.source_files = 'Coordinator/Classes/**/*'
  s.dependency 'Timeline', '0.1.1'
end
