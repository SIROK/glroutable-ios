#
# Be sure to run `pod lib lint GLRoutable.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GLRoutable"
  s.version          = "0.1.0"
  s.summary          = "GLRoutable is a library to make it easy to create deep link"
  s.description      = <<-DESC
                       GLRoutable is a library to make it easy to create deep link
                       You can use this by using cocoapods
                       DESC
  s.homepage         = "https://github.com/SIROK/glroutable-ios"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "TABATAKATSUTOSHI" => "t.katsu22@gmail.com" }
  s.source           = { :git => "https://github.com/SIROK/glroutable-ios.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GLRoutable' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
