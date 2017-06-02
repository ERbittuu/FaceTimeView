Pod::Spec.new do |s|
  s.name             = 'FaceTimeView'
  s.version          = '1.0.0'
  s.summary          = 'FaceTimeView is lightweight control like Facetime app(Live camera, video and other option on view backgournd)'

  s.homepage         = 'https://github.com/erbittuu/FaceTimeView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erbittuu' => 'erbittuu@gmail.com' }
  s.source           = { :git => 'https://github.com/erbittuu/FaceTimeView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/erbittuu'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FaceTimeView/Classes/**/*'
end