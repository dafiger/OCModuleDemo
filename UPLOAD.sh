#!/bin/bash
# chmod 755 xxx.sh

# 定义颜色
HighLightColor='\033[0;36m'
DefaultColor='\033[0;m'

# 版本号
UpVersion=''
# Spec仓库名称
SpecName='_SpecName_'
# Spec仓库主页地址
SpecHomePage='_SpecHomePage_'
# 确认状态
ConfirmStatus='N'

# 输入版本号
InputVersion() {
	echo -e "\n"
	read -p 'Please input version: ' UpVersion
	if 
    	test -z ${UpVersion};
    then
    	InputVersion
    fi
}

# 审查输入内容
CheckInfomation() {
    InputVersion

    echo -e "\n================================================"
    echo -e "  Version       :  ${HighLightColor}${UpVersion}${DefaultColor}"
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

# 文件路径
spec_Path="./_ProjectName_.podspec"

# 修改文件内容
echo "Start editing..."
# 老方法
# sed -i "" "s%_RepositoryVersion_%${UpVersion}%g" "${spec_Path}"
# 新方法
# version_str="awk 'NR==m{print $5}' ${spec_Path} "
version_str="sed -n 5p ${spec_Path}"
version_spec=$(${version_str})
version_show="s.version      = '${UpVersion}'"
echo "Update:${version_spec},${version_show},${spec_Path}"
sed -i "" "s%${version_spec}%${version_show}%g" "${spec_Path}"

echo "Edit finished"

# git add .
# git commit -m "update to _ProjectName_ tag:${UpVersion}"
# git tag ${UpVersion}
# git push
# git push --tags
# pod repo push ${SpecName} _ProjectName_.podspec --verbose --allow-warnings --use-libraries --use-modular-headers

echo "Start upload..."
git add .
git commit -m "update to _ProjectName_ tag:${UpVersion}"
git push origin master -f 
git tag ${UpVersion}
# git push
git push --tags
pod repo push ${SpecName} _ProjectName_.podspec --verbose --allow-warnings --use-libraries --use-modular-headers
echo "Upload finished"

# 更新本地spec库
# pod repo update ${SpecName}
# pod update --no-repo-update

# 恢复原文件内容
# version_spec='s.version      = '_RepositoryVersion_''
# version_str="awk 'NR==m{print $5}' ${spec_Path} "
# version_str="sed -n 5p ${spec_Path}"
# version_spec=$(${version_str})

# version_show='s.version      = '${UpVersion}''

# echo "Update:${version_show},${version_spec},${spec_Path}"

# sed -i "" "s%${version_show}%${version_spec}%g" "${spec_Path}"



