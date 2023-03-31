#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint plugin_analytics.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'plugin_analytics'
  s.version          = '0.0.1'
  s.summary          = 'Exemple de Pigeon en implémentant un plugin sur Piano Analytics'
  s.description      = <<-DESC
Exemple de Pigeon en implémentant un plugin sur Piano Analytics
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'PianoAnalytics/iOS', '>=3.0'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
