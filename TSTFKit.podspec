
Pod::Spec.new do |s|

s.name         = "TSTFKit"
s.version      = "1.0.3"
s.summary      = "A Lib For TextField."
s.description  = <<-DESC
TFKit是一个综合类的textfield工具类。
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/TSTFKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.requires_arc = true

s.source       = { :git => "https://github.com/StoneStoneStoneWang/TSTFKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{h,m}"

end
