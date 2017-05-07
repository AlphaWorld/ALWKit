Pod::Spec.new do |s|
s.name = 'ALWkit'
s.version = '2.0.0'
s.license = 'MIT'
s.summary = '个人常用的一些小技巧与小工具.'
s.homepage = 'https://github.com/JohnGump/ALkit'
s.authors = { 'AlphaWorld' => 'JohnGump@163.com' }
s.source = { :git => 'https://github.com/JohnGump/ALkit.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'ALkit/**/*.{h,m}'
s.dependency 'MBProgressHUD', '~> 0.9.1'
s.dependency 'Reachability'

end
