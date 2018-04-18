Pod::Spec.new do |s|
  s.name             = 'MABAlertController'
  s.version          = '1.0'
  s.summary          = 'A customized AlertController'
 
  s.description      = <<-DESC
A customized AlertController (including animations) that lets you design your AlertControllers within Storyboards (written in swift).
                       DESC
 
  s.homepage         = 'https://github.com/muhammadbassio/MABAlertController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Muhammad Bassio' => 'muhammadbassio@gmail.com' }
  s.source           = { :git => 'https://github.com/muhammadbassio/MABAlertController.git', :tag => s.version.to_s }
 
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.ios.deployment_target = '10.0'
  s.source_files = 'source/*.swift', 'source/PresentationController/*.swift'
 
end