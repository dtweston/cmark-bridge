#
# Be sure to run `pod lib lint cmark-bridge.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "cmark-bridge"
  s.version          = "0.1.3"
  s.summary          = "A tiny pod to make cmark available to Swift."
  s.description      = <<-DESC
                       A tiny pod that only provides a bridging header.
                       DESC
  s.homepage         = "https://github.com/dtweston/cmark-bridge"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Dave Weston" => "dave.weston@binocracy.com" }
  s.source           = { :git => "https://github.com/dtweston/cmark-bridge.git", :tag => s.version.to_s, :submodules => true }
  s.social_media_url = 'https://twitter.com/dt_weston'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*', 'Pod/cmark/src', 'Pod/cmark/build/src/*.h'
  s.resource_bundles = {
    'cmark-bridge' => ['Pod/Assets/*.png']
  }

  s.prepare_command = 'cd Pod/cmark && make'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
