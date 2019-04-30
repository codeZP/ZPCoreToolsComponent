
Pod::Spec.new do |s|

  s.name         = 'ZPCoreToolsComponent'
  s.version      = '1.0.0'
  s.summary      = '项目的公共类库'
  s.description  = <<-DESC
			项目的公共类库
                   DESC

  s.homepage     = 'https://github.com/codeZP/ZPCoreToolsComponent'
  s.license      = 'MIT'
  s.author             = { 'CodeZP' => 'ioszpwork@163.com' }
  s.platform     = :ios, '8.0'

  s.source       = { :git => 'https://github.com/codeZP/ZPCoreToolsComponent.git', :tag => s.version }
  s.source_files = 'ZPCoreToolsComponent/ZPTools/*'
  s.dependency 'AFNetworking'
  s.dependency 'SDWebImage'
  s.dependency 'MJRefresh'
end
