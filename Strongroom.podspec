#
# Be sure to run `pod lib lint Strongroom.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Strongroom'
  s.version          = '0.1.1'
  s.summary          = 'Strongroom allows you to save and retrieve any types of values using a key.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Save and retrieve any types of values using a key.
                       DESC

  s.homepage         = 'https://github.com/myriadmobile/Strongroom'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ios@myriadmobile.com' => 'ios@myriadmobile.com' }
  s.source           = { :git => 'git@github.com:myriadmobile/Strongroom.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Strongroom/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Strongroom' => ['Strongroom/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'SAMKeychain'
end
