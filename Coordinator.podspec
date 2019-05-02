Pod::Spec.new do |s|
  s.name             = 'Coordinator'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Coordinator.'

  s.description      = 'description'

  s.homepage         = 'https://github.com/rafael-silva/Coordinator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rafael-silva' => 'rafael.matos@involves.com.br' }
  s.source           = { :git => 'https://github.com/rafael-silva/Coordinator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Coordinator/Classes/**/*'

  # s.dependency 'AFNetworking', '~> 2.3'
end
