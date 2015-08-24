Pod::Spec.new do |s|

  s.name         = 'Swift-CollectionView'
  s.version      = '0.1'
  s.summary      = 'A short description of CollectionView.'
  s.homepage     = 'http://github.com/sysadminPSQ/Swift-CollectionView'
  s.license      = 'MIT'
  s.author       = { 'Akash K' => 'akash@peppersquare.com' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/sysadminPSQ/Swift-CollectionView.git', :tag => '0.1' }
  s.source_files  = 'Swift-CollectionView', 'Swift-CollectionView/**/*.{swift}'
  s.frameworks = 'SystemConfiguration', 'UIKit'
  s.preserve_paths = 'Swift-CollectionView.framework'
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/Swift-CollectionView' }
  s.requires_arc = true

end

