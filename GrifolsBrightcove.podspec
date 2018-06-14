#
#  Be sure to run `pod spec lint GrifolsBrightcove.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name          = "GrifolsBrightcove"
  s.version       = "0.0.1"
  s.summary       = "A brightcove handler"

  s.homepage      = "http://grifols.com"
  s.license       = "MIT"

  s.author        = { "Joan Molinas Ramon" => "joan.molinas@external.grifols.com" }
  s.platform      = :ios

  s.source        = { :git => "https://github.com/ulidev/GrifolsBrightcove.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Source/**/*.swift"

end
