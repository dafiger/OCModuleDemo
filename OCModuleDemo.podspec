Pod::Spec.new do |s|
  s.name         = '_ProjectName_'
  s.version      = '0.0.1'
  s.summary      = '_ProjectName_'

  s.description  = <<-DESC
                    this is _ProjectName_
                   DESC

  s.homepage     = '_RepositoryHomePage_'

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = '_Author_'

  s.platform     = :ios, "8.0"
#    s.ios.deployment_target = "8.0"

  s.source       = { :git => '_HTTPSRepositoryPath_', :tag => s.version.to_s }

#    文件路径
#    s.source_files = '_ProjectName_/Classes/**/*.{h,m,mm}'
#    s.source_files = '_ProjectName_/Classes/**/*.{h,m,mm}', '_ProjectName_/Other/**/*'
#    被排除的文件
#    s.exclude_files = '_ProjectName_/Classes/**/unused.{h,m}'

#    公开头文件
  s.public_header_files = '_ProjectName_/Classes/**/*.h'
#    私有头文件
#    s.private_header_files = '_ProjectName_/Classes/**/*.h'
#    预编译文件
  s.prefix_header_file = false
#    s.prefix_header_file = '_ProjectName_/Classes/prefix.pch'
#    s.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import <Foundation/Foundation.h>'
#    s.prefix_header_contents = '#import "Masonry.h"', '#import "YYModel.h"', '#import "SDWebImageManager.h"', '#import "UIImageView+WebCache.h"', '#import "UIButton+WebCache.h"'

#    资源文件1
  s.resource_bundles = {
    '_ProjectName_' => ['_ProjectName_/Assets/**/*']
  }
#    s.resource_bundles = {
#      '_ProjectName_Images_bundle' => ['_ProjectName_/Resource.bundle'],
#      '_ProjectName_Images_resource' => ['_ProjectName_/Resource.xcassets'],
#      '_ProjectName_Images_png' => ['_ProjectName_/Resource/**/*.png'],
#      '_ProjectName_Images_jpg' => ['_ProjectName_/Resource/**/*.jpg'],
#      '_ProjectName__storyboard' => ['_ProjectName_/Classes/**/*.storyboard'],
#      '_ProjectName__xib' => ['_ProjectName_/Classes/**/*.xib'],
#    }
#    资源文件2
#    s.resources = 'Resource.bundle', 'Resource.xcassets'
#    s.resources = ['_ProjectName_/Resource/**/*.png', '_ProjectName_/Resource/**/*.jpg']
#    s.resources = 'Resource/**/*.{png,jpg,jpeg,xcassets,bundle,storyboard,xib,json,plist,db,a,framework}'

#    文件分级
#    s.subspec 'Core' do |ss|
#      ss.source_files = '_ProjectName_/Classes/Core/**/*'
#      ss.public_header_files = '_ProjectName_/Classes/Header/*.h'
#      ss.private_header_files = '_ProjectName_/Classes/Header/*.h'
#      ss.dependency 'xxx'
#      ss.dependency 'xxx/xxx'
#    end

  s.subspec 'Headers' do |ss|
      ss.source_files = '_ProjectName_/Classes/Header/**/*'
      ss.public_header_files = '_ProjectName_/Classes/Header/*.h'
  end
  
  s.subspec 'Classes' do |ss|
    ss.source_files = '_ProjectName_/Classes/**/*'
    ss.exclude_files = '_ProjectName_/Classes/Header/**/*'
    ss.public_header_files = '_ProjectName_/Classes/**/*.h'
  end

#    静态库
#    .a 或 libz.tbd 后缀不要, 名字里lib开头的三个字母不要, libz.tbd 应写成 'z'
#    s.libraries 依赖苹果官方静态库, 类似libstdc++.a, libsqlite.a等a文件
#    s.libraries = 'iconv', 'sqlite3', 'stdc++', 'z'
#    s.vendored_libraries 依赖第三方静态库, 类似libWeChatSDK.a, libWeiboSDK.a等a文件
#    s.vendored_libraries = 'Resource/lib/**/*.{a}', 'xxx'

#    动态库
#    s.frameworks = "UIKit", "Foundation"
#    s.frameworks 依赖苹果官方动态库, 类似UIKit, SystemConfiguration等framework文件
#    s.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration'
#    s.vendored_frameworks 依赖第三方动态库, 类似TencentOpenAPI.framework等framework文件
#    s.vendored_frameworks = 'Resource/Framework/**/*.{framework}'
#    framework要加preserve_paths预加载路径
#    s.preserve_paths = 'Resources/**/*.{framework, a}', 'xxx'
#    s.preserve_paths = 'xxx', 'xxx'

#    ARC
  s.requires_arc = true
#    s.requires_arc = false
#    s.requires_arc = 'Classes/Arc' 该文件夹下是ARC, 其它非ARC

#  s.default_subspec = 'Classes'

#   s.dependency 'xxx', :path => 'xxx/xxx'
#   s.dependency 'AFNetworking', '~> 3.2.1'

end
