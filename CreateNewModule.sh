#!/bin/bash
# chmod 755 CreateNewModule.sh

# 定义颜色
HighLightColor='\033[0;36m'
DefaultColor='\033[0;m'

# 工程名
ProjectName=''
# 组织名
OrganizationName=''
# 模板工程clone地址
DemoClonePath='https://github.com/dafiger/OCModuleDemo.git'
# 模板工程名
DemoName='OCModuleDemo'

# 作者
Author='dafiger'
# 作者和组织一样
# Author="${OrganizationName}"

# 仓库地址
HTTPSRepositoryPath=''
# 仓库主页地址
RepositoryHomePage=''
# Spec仓库名称
SpecName='DFPublicSpec'
# Spec仓库主页地址
SpecHomePage='https://github.com/dafiger/DFPublicSpec.git'

# 确认状态
ConfirmStatus='N'

# 输入项目名
InputProjectName() {
    echo -e "\n"
	read -p 'Please input your Project name: ' ProjectName
    if 
    	test -z ${ProjectName};
    then
    	InputProjectName
    fi
}

# 输入组织名
InputOrganizationName() {
    echo -e "\n"
    read -p 'Please input your Organization name: ' OrganizationName
    if 
    	test -z ${OrganizationName};
    then
    	InputOrganizationName
    fi
    # 作者和组织一样
    Author="${OrganizationName}"
}

# 输入仓库地址
InputRepositoryPath() {
    echo -e "\n"
    read -p 'Please input your Repository Path: ' HTTPSRepositoryPath
    if 
        test -z ${HTTPSRepositoryPath};
    then
        InputRepositoryPath
    fi
    # 截取字符串
    RepositoryHomePage=${HTTPSRepositoryPath%.git*}
}

# 输入仓库主页地址
# InputRepositoryHomePage() {
#     echo -e "\n"
#     read -p 'Please input your Repository HomePage: ' RepositoryHomePage
#     if 
#         test -z ${RepositoryHomePage};
#     then
#         InputRepositoryHomePage
#     fi
# }

# 审查输入内容
CheckInfomation() {
    InputProjectName
    InputOrganizationName
    InputRepositoryPath
    # InputRepositoryHomePage

    echo -e "\n================================================"
    echo -e "  Project Name        :  ${HighLightColor}${ProjectName}${DefaultColor}"
    echo -e "  Organization Name   :  ${HighLightColor}${OrganizationName}${DefaultColor}"
    echo -e "  Author              :  ${HighLightColor}${Author}${DefaultColor}"
    echo -e "  Repository Path     :  ${HighLightColor}${HTTPSRepositoryPath}${DefaultColor}"
    echo -e "  Repository HomePage :  ${HighLightColor}${RepositoryHomePage}${DefaultColor}"
    echo -e "  Spec Name           :  ${HighLightColor}${SpecName}${DefaultColor}"
    echo -e "  Spec HomePage       :  ${HighLightColor}${SpecHomePage}${DefaultColor}"
    echo -e "================================================\n"
}

# 循环检查
while [ ${ConfirmStatus} != 'y' -a ${ConfirmStatus} != 'Y' ]
do
    if 
        [ ${ConfirmStatus} == 'n' -o ${ConfirmStatus} == 'N' ]; 
    then
        CheckInfomation
    fi
    read -p 'Are you sure? (y/n):' ConfirmStatus
done

# 返回桌面
cd
cd Desktop/

# 桌面新建文件夹
# mkdir ${ProjectName}
# date_now=`date +%Y%m%d`
date_now=`date +%Y%m%d%H%M%S`
mkdir -p ${ProjectName}/${date_now}
cd ${ProjectName}/${date_now}

# 下载模板工程
git clone ${DemoClonePath}
# ls

# 复制主工程
# 递归拷贝
# cp -r "${DemoName}" "${ProjectName}"
# 直接拷贝不需要询问
# cp -f "${DemoName}" "${ProjectName}"
# 主工程重新命名
mv "${DemoName}" "${ProjectName}"
# 打开工程
cd ${ProjectName}
# 主工程下的文件重新命名
mv "${DemoName}" "${ProjectName}"
mv "${DemoName}.podspec" "${ProjectName}.podspec"

cd "${ProjectName}/Classes/Headers"
mv "${DemoName}_header.h" "${ProjectName}_header.h"
cd ../../../

cd Demo
mv "${DemoName}" "${ProjectName}"
mv "${DemoName}.xcodeproj" "${ProjectName}.xcodeproj"
cd ../

# 文件路径
license_Path="./LICENSE"
gitignore_Path="./Demo/.gitignore"
readme_Path="./README.md"
podfile_Path="./Demo/Podfile"
spec_Path="./${ProjectName}.podspec"
upload_Path="./UPLOAD.sh"

pbxproj_Path="./Demo/${ProjectName}.xcodeproj/project.pbxproj"
xcworkspacedata_Path="./Demo/${ProjectName}.xcodeproj/project.xcworkspace/contents.xcworkspacedata"

# 修改文件内容
echo "Start editing..."

sed -i "" "s%_Author_%${Author}%g"              "${license_Path}"
sed -i "" "s%_ProjectName_%${ProjectName}%g"    "${gitignore_Path}"
sed -i "" "s%_ProjectName_%${ProjectName}%g"    "${readme_Path}"

sed -i "" "s%_ProjectName_%${ProjectName}%g"       "${podfile_Path}"
sed -i "" "s%_SpecHomePage_%${SpecHomePage}%g"     "${podfile_Path}"

sed -i "" "s%_ProjectName_%${ProjectName}%g"                  "${spec_Path}"
sed -i "" "s%_Author_%${Author}%g"                            "${spec_Path}"
sed -i "" "s%_RepositoryHomePage_%${RepositoryHomePage}%g"    "${spec_Path}"
sed -i "" "s%_HTTPSRepositoryPath_%${HTTPSRepositoryPath}%g"  "${spec_Path}"

sed -i "" "s%_ProjectName_%${ProjectName}%g"          "${upload_Path}"
sed -i "" "s%_SpecName_%${SpecName}%g"                "${upload_Path}"
sed -i "" "s%_SpecHomePage_%${SpecHomePage}%g"        "${upload_Path}"

# 组织名修改
sed -i "" "s%dafiger%${OrganizationName}%g"   "${pbxproj_Path}"
# BundleId修改
# sed -i "" "s%ProjectDemoOC%${ProjectName}%g"  "${pbxproj_Path}"
# 工程相关的命名修改
sed -i "" "s%${DemoName}%${ProjectName}%g"    "${pbxproj_Path}"
sed -i "" "s%${DemoName}%${ProjectName}%g"    "${xcworkspacedata_Path}"

echo "Edit finished"

echo "Start cleaning..."

rm -rf .git
cd Demo
rm -rf .DS_Store
rm -rf ${ProjectName}.xcodeproj/xcuserdata/
rm -rf ${ProjectName}.xcodeproj/project.xcworkspace/xcuserdata/
rm -rf ${ProjectName}.xcodeproj/project.xcworkspace/xcshareddata/

echo "Clean finished"

# 添加spec本地库
pod repo add ${SpecName} ${SpecHomePage}

cd ../
git init
git remote add origin ${HTTPSRepositoryPath} 

cd Demo
pod install

echo "Good luck for you!"















