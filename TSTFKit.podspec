
Pod::Spec.new do |s|

s.name         = "TSTFKit"
s.version      = "1.0.7"
s.summary      = "A Lib For TextField."
s.description  = <<-DESC
TFKit is a smart tool for tf。
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/TSTFKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.requires_arc = true

s.frameworks = 'UIKit', 'Foundation'

s.source = { :git => "https://github.com/StoneStoneStoneWang/TSTFKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{h,m}"

s.dependency 'TS_ToolKit'

end
