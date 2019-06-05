Pod::Spec.new do |s|

  s.name         = '_ProjectName_'
  # s.version      = '_RepositoryVersion_'
  s.version      = '0.0.1'
  s.summary      = '_ProjectName_'

  s.description  = <<-DESC
                    this is _ProjectName_
                   DESC

  s.homepage     = '_RepositoryHomePage_'

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = '_Author_'

  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => '_HTTPSRepositoryPath_', :tag => s.version.to_s }
  # s.source =     { :svn => "http://jinjian@svn.sogou-inc.com/svn/browser/seqa/qacts/TestResource", :tag => "#{s.version}" }
  # s.source = { :http => 'http://dev.wechatapp.com/download/sdk/WeChat_SDK_iOS_en.zip',
  #              :sha1 => '7e21857fe11a511f472cfd7cfa2d979bd7ab7d96' }
  # s :path => '/Documents/PrettyKit/PrettyKit.podspec'

  # 文件路径
  # s.source_files  = '_ProjectName_/**/*.{h,m,mm,swift}'
  # s.source_files = 'Classes/**/*.{h,m}', 'More_Classes/**/*.{h,m}'

  # 公开头文件
  s.public_header_files = '_ProjectName_/Classes/ModuleManager/**/*.h'
  # s.public_header_files = '_ProjectName_/**/*.h'
  # 私有头文件
  # s.private_header_files = 'Headers/Private/*.h'
  # 预编译文件
  s.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import <Foundation/Foundation.h>', '#import "_ProjectName_Header.h"'
  # s.prefix_header_file = 'iphone/include/prefix.pch'
  # s.prefix_header_contents = '#import "Masonry.h"','#import "YYModel.h"','#import "SDWebImageManager.h"','#import "UIImageView+WebCache.h"','#import "UIButton+WebCache.h"'

  # 被排除的文件
  # spec.exclude_files = 'Classes/**/unused.{h,m}'

  # 资源文件1
  s.resource_bundles = {
    '_ProjectName_' => ['_ProjectName_/Assets/**/*']
  }
  # s.resource_bundles = { 
  #   '_ProjectName_ResourceBundle' => ['_ProjectName_/Resource_bundle.xcassets'],
  #   '_ProjectName_OtherResources' => ['_ProjectName_/Resource']
  # }
  # s.ios.resource_bundle = { 'MapBox' => 'MapView/Map/Resources/*.png' }
  # s.resource_bundles = {
  #   'MapBox' => ['MapView/Map/Resources/*.png'],
  #   'OtherResources' => ['MapView/Map/OtherResources/*.png']
  # }

  # s.resource_bundles = {   
  #   'MapBox' => 'MapView/Map/Resources/*.png' 
  #   'XBPodSDK' => ['XBPodSDK/Assets/**']
  # }
  # s.resource_bundles = { 
  #   'DFImageBundle' => ['DFBasePlug/DFBasePlug/Images/*'],
  #   'DFStoryboardBundle' => ['DFBasePlug/DFBasePlug/StoryboardAndXib/*'],
  #   'DFWebBundle' => ['DFBasePlug/DFBasePlug/Webfiles/*'],
  #   'DFOtherBundle' => ['DFBasePlug/DFBasePlug/Others/*']
  # }
  # 资源文件2 
  # s.resource = ['resource.xcassets']
  # s.resource = 'Resources/HockeySDK.bundle'
  # s.resources = ['Images/*.png', 'Sounds/*']

  # s.resources  = 'Resources/**/*.{png,jpg,jpeg,xcassets,bundle,storyboard,xib,json,plist,db}'
  # s.resources  = '_ProjectName_/**/*.{png,jpg,jpeg,xcassets,bundle,storyboard,xib,json,plist,db}', '_ProjectName_/Assets.xcassets'
  # s.resources  = ['_ProjectName_/**/*.{png,jpg,jpeg,xcassets,bundle,storyboard,xib,json,plist,db}']
  # s.resources  = '_ProjectName_/**/*.{png,jpg,jpeg,xcassets,bundle,storyboard,xib,json,plist,db}'
  
  #---------------------------文件分级---------------------------#
  # s.subspec 'Core' do |ss|
  #     ss.source_files = 'BSSBaseDependTool/Classes/NetWork/*'
  #     ss.public_header_files = 'Pod/Classes/NetworkEngine/**/*.h'
  #     ss.dependency 'YTKNetwork'
  #     ss.dependency 'BSSBaseDependTool/BSSConfiguration'
  # end

  s.subspec 'Header' do |ss|
      ss.source_files = '_ProjectName_/Classes/Header/**/*'
      # ss.public_header_files = '_ProjectName_/Classes/Header/*.h'
      ss.private_header_files = '_ProjectName_/Classes/Header/*.h'
  end

  s.subspec 'Classes' do |ss|
      ss.source_files = '_ProjectName_/Classes/**/*'
      # ss.public_header_files = '_ProjectName_/Classes/**/*.h'
      ss.private_header_files = '_ProjectName_/Classes/**/*.h'

      ss.exclude_files = '_ProjectName_/Classes/Header/**/*', '_ProjectName_/Classes/ModuleManager/**/*'
      ss.dependency '_ProjectName_/Header'
  end

  s.subspec 'ModuleManager' do |ss|
      ss.source_files = '_ProjectName_/Classes/ModuleManager/**/*'
      # ss.public_header_files = '_ProjectName_/Classes/ModuleManager/**/*.h'
      
      ss.dependency '_ProjectName_/Classes'
  end

  # s.subspec 'Crash' do |ss|
  #     ss.source_files = 'DFBasePlug/DFBasePlug/Classes/Crash/*'
  #     ss.public_header_files = 'DFBasePlug/DFBasePlug/Classes/Crash/*.h'
  #     ss.dependency 'DFBasePlug/Header'
  # end

  # s.subspec 'Model' do |ss|
  #     ss.source_files = 'DFBasePlug/DFBasePlug/Classes/Model/*'
  #     ss.public_header_files = 'DFBasePlug/DFBasePlug/Classes/Model/*.h'
  #     ss.dependency 'DFBasePlug/Header'
  # end


  # s.libraries  表示这个pod依赖的 苹果官方的库，也就是类似libstdc++.a ,libsqlite.a 等等的a文件；
  # s.vendored_libraries 就表示用户自己的a文件，比如新浪微博SDK的libWeiboSDK.a, 微信libWeChatSDK.a；
  # s.frameworks 表示pod依赖的 苹果的framework， 比如 UIKit，SystemConfiguration等等
  # s.vendored_frameworks， 表示pod依赖的自己的framework，比如QQSDK的TencentOpenAPI.framework，JSPatch热更新JSPatchPlatform.framework;
  # .a 或者 libz.tbd 后缀不要，名字里lib开头的三个字母不要，libz.tbd 应写成 'z'

  # framework要加preserve_paths 预加载路径
  # s.preserve_paths = "Resources/**/*.{framework,a}"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # 使用系统库
  s.frameworks = "UIKit", "Foundation"
  # s.ios.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.frameworks = 'SystemConfiguration','CoreGraphics','CoreTelephony','Security','CoreLocation','JavaScriptCore'
  # s.frameworks = 'UIKit','Foundation','QuartzCore','SystemConfiguration','CoreText','CoreGraphics','CoreTelephony','QuartzCore','CFNetwork','CoreMotion'

  # 指定三方库的路径
  # s.ios.vendored_framework = 'MyPod/Frameworks/MyFramework.framework'
  # s.vendored_frameworks = 'Resources/Framework/**/*.{framework}'
  # s.vendored_frameworks = 'PRShopModule/Alipay/AlipaySDK.framework'
  # s.vendored_frameworks = 'MyFramework.framework', 'TheirFramework.framework'

  # 使用静态库
  # s.ios.library   = 'Libraries/libProj4.a'
  # s.libraries = "iconv", "xml2"
  # s.libraries =  'iconv','sqlite3','stdc++','z'
  # s.libraries = 'c++','z'

  # 指定三方库的路径
  # s.ios.vendored_library = 'MyPod/Frameworks/MyFramework.framework'
  # s.vendored_libraries  = 'Resources/lib/**/*.{a}'

  # ARC
  s.requires_arc = true
  # s.requires_arc = false
  # s.requires_arc = 'Classes/Arc'   //该文件夹下是ARC,其它非ARC
  # s.requires_arc = ['Classes/*ARC.m', 'Classes/ARC.mm']

  # 配置  
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SRCROOT)/usr/include/libxml2" }
  # s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/xxx/xxx"' }
  # s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "Resources/Framework" }
  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(SRCROOT)/libs/Frameworks/Huoyan"' }   
  # s.xcconfig  = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/iOS_Util/iOS_Util/AMR/lib"' }
  # s.xcconfig  = { "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/boost" }

  # s.default_subspec = 'Classes'

  # s.dependency 'JSONKit', '~> 1.4'
  # s.dependency 'BaseModel', :path => 'BaseProject/BaseModel'
  # s.dependency 'AFNetworking', '~> 3.2.1'
  # s.dependency 'BasePlug'

end
