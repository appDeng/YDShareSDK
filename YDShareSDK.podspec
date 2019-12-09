#
# Be sure to run `pod lib lint YDShareSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YDShareSDK'
  s.version          = '0.1.0'
  s.summary          = '移动中台 YDShareSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    基于GitHub上ShareSDK封装的分享SDK
                       DESC

  s.homepage         = 'https://github.com/denghuan/YDShareSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'denghuan' => 'denghuanccnu@163.com' }
  s.source           = { :git => 'https://github.com/denghuan/YDShareSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YDShareSDK/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YDShareSDK' => ['YDShareSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'mob_sharesdk'
    s.dependency 'mob_sharesdk/ShareSDKPlatforms/WeChat'
    s.dependency 'mob_sharesdk/ShareSDKPlatforms/QQ'
    s.dependency 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'

end
