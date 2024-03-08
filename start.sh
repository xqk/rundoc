#!/bin/bash
set -eux

# 默认资源
if [ ! -d "/rundoc/conf" ]; then mkdir -p "/rundoc/conf" ; fi
if [[ -z "$(ls -A -- "/rundoc/conf")" ]] ; then cp -r "/rundoc/__default_assets__/conf" "/rundoc/" ; fi

if [ ! -d "/rundoc/static" ]; then mkdir -p "/rundoc/static" ; fi
if [[ -z "$(ls -A -- "/rundoc/static")" ]] ; then cp -r "/rundoc/__default_assets__/static" "/rundoc/" ; fi

if [ ! -d "/rundoc/views" ]; then mkdir -p "/rundoc/views" ; fi
if [[ -z "$(ls -A -- "/rundoc/views")" ]] ; then cp -r "/rundoc/__default_assets__/views" "/rundoc/" ; fi

if [ ! -d "/rundoc/uploads" ]; then mkdir -p "/rundoc/uploads" ; fi
if [[ -z "$(ls -A -- "/rundoc/uploads")" ]] ; then cp -r "/rundoc/__default_assets__/uploads" "/rundoc/" ; fi

# 如果配置文件不存在就复制
cp --no-clobber /rundoc/conf/app.conf.example /rundoc/conf/app.conf

# 数据库等初始化
/rundoc/rundoc_linux_amd64 install

# 运行
/rundoc/rundoc_linux_amd64

# # Debug Dockerfile
# while [ 1 ]
# do
#     echo "log ..."
#     sleep 5s
# done