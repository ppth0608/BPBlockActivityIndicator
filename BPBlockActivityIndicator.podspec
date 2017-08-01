Pod::Spec.new do |s|
  s.name         = "BPBlockActivityIndicator"
  s.version      = "1.1"
  s.summary      = "BPBlockActivityIndicator Indicator that display the progress of an ongoing task on iOS"
  s.description  = "BPBlockActivityIndicator is a clean and easy-to-use Activity Indicator meant to display the progress of an ongoing task on iOS."
  s.homepage     = "https://github.com/ppth0608/BPBlockActivityIndicator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Ben.Park" => "ppth0608@naver.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/ppth0608/BPBlockActivityIndicator.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "UIKit"
end
