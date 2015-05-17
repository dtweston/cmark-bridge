Pod::Spec.new do |s|
  s.name             = "cmark-bridge"
  s.version          = "1.0"
  s.summary          = "A tiny pod to make cmark available to Swift."
  s.description      = <<-DESC
                       A tiny pod that only provides a bridging header.
                       DESC
  s.homepage         = "https://github.com/dtweston/cmark-bridge"
  s.license          = 'MIT'
  s.author           = { "Dave Weston" => "dave.weston@binocracy.com" }
  s.source           = { :git => "https://github.com/dtweston/cmark-bridge.git", :tag => s.version.to_s, :submodules => true }
  s.social_media_url = 'https://twitter.com/dt_weston'

  s.ios.deployment_target     = '8.0'
  s.osx.deployment_target     = '10.10'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*', 'Pod/cmark/src', 'Pod/cmark/build/src/*.h'
  s.exclude_files = 'Pod/cmark/src/main.c'
  s.preserve_paths = 'Pod/cmark/src/*.inc'

  s.prepare_command = 'cd Pod/cmark && make'

  s.public_header_files = 'Pod/cmark/src/cmark.h', 'Pod/cmark/build/src/cmark_export.h', 'Pod/cmark/build/src/cmark_version.h'
end
