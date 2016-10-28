Pod::Spec.new do |s|
s.name = 'DLAlertViewLiu'
s.version = '1.0.2'
s.license = 'MIT'
s.summary = 'DLAlertView in iOS.'
s.homepage = 'https://github.com/ComputerNot/DLAlertView'
s.authors = { 'johnLiu' => 'computernot@qq.com' }
s.source = { :git => "https://github.com/ComputerNot/DLAlertView.git", :tag => s.version.to_s}
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = "Classes", "DLAlertViewDemo/DLAlertViewDemo/DLAlertView/*"
end
