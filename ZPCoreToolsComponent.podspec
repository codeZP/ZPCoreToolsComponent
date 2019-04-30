
Pod::Spec.new do |s|

  s.name         = 'ZPCoreToolsComponent'
  s.version      = '1.0.2'
  s.summary      = '项目的公共类库'
  s.description  = <<-DESC
			项目的公共类库
                   DESC

  s.homepage     = 'https://github.com/codeZP/ZPCoreToolsComponent'
  s.license      = 'MIT'
  s.author             = { 'CodeZP' => 'ioszpwork@163.com' }
  s.platform     = :ios, '8.0'

  s.source       = { :git => 'https://github.com/codeZP/ZPCoreToolsComponent.git', :tag => s.version }
  s.source_files = 'ZPCoreToolsComponent/ZPCoreToolsComponent/ZPTools/*'
  s.dependency 'AFNetworking'               #网络框架
  s.dependency 'KINWebBrowser'              #webView 
  s.dependency 'SDWebImage'                 #图片加载
  s.dependency 'MJRefresh'                  #刷新控件
  s.dependency 'Masonry'                    #自动布局
  s.dependency 'IQKeyboardManager'          #防止键盘遮挡
  s.dependency 'HBDNavigationBar'           #nav的封装
  s.dependency 'MJExtension'                #字典转模型
#根据需求打开
  # s.dependency 'TTTAttributedLabel'       #富文本lable
  # s.dependency 'RJBadgeKit'               #小红点提示
  # s.dependency 'WebViewJavascriptBridge'  #js交互
  # s.dependency 'PGPickerView'             #选择控件
  # s.dependency 'XHLaunchAd'               #广告
  # s.dependency 'CocoaAsyncSocket'         #长连接API
  # s.dependency 'NJKWebViewProgress'       #网页打开进度条
end
