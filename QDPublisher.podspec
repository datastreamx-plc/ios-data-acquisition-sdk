#
#  Be sure to run `pod spec lint QDPublisher.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "QDPublisher"
  spec.version      = "0.0.8"
  spec.summary      = "A short description of QDPublisher."
  spec.description  = <<-DESC
  example desc
                   DESC

  spec.homepage     = "https://www.quadrant.io"
  spec.license      = "MIT (Example)"
  spec.author       = { "Syaiful Amin" => "syaiful@quadrant.io" }
  spec.source       = { git: "https://github.com/syaifulQ/QDPublisher.git", tag: "#{spec.version}" }
  spec.ios.deployment_target = '9.0'
  spec.ios.vendored_frameworks = 'QDPublisher.xcframework'
  spec.dependency 'GzipSwift'

end
