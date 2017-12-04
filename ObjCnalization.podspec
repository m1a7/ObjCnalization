#
# Be sure to run `pod lib lint ObjCnalization.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ObjCnalization'
  s.version          = '0.2.0'
  s.summary          = 'Localize iOS apps in a smarter way using JSON files. ObjC framework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'ObjC library that helps in localizing apps in a different, better, simpler, more powerful way than system localization does'
#TODO: Add long description of the pod here.


  s.homepage         = 'https://github.com/m1a7/ObjCnalization'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'm1a7' => 'thisismymail03@gmail.com' }
  s.source           = { :git => 'https://github.com/m1a7/ObjCnalization.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

 s.source_files = 'ObjCnalization/Classes/**/*.{h,m}'

  # s.resource_bundles = {
  #   'ObjCnalization' => ['ObjCnalization/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
