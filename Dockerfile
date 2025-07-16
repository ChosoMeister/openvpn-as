# 使用openvpn/openvpn-as作为基准镜像
FROM openvpn/openvpn-as:2.14.3-5936bcd7-Ubuntu24

# 将当前目录下的uprop.py文件复制到容器中的指定位置
COPY uprop.py /path/to/pyovpn/lic/uprop.py

# 安装必要的软件包
RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    vim \
    && rm -rf /var/lib/apt/lists/*

# 复制egg文件到当前目录并解压
RUN cp /usr/local/openvpn_as/lib/python/pyovpn-2.0-py3.12.egg /root/ \
    && unzip -q /root/pyovpn-2.0-py3.12.egg -d /root/

# 重命名uprop.pyc文件
RUN mv /root/pyovpn/lic/uprop.pyc /root/pyovpn/lic/uprop2.pyc

RUN cp /path/to/pyovpn/lic/uprop.py /root/pyovpn/lic/

# 编译Python文件并移动编译后的文件
RUN python3 -O -m compileall /root/pyovpn/lic/uprop.py \
    && mv /root/pyovpn/lic/__pycache__/uprop.*.pyc /root/pyovpn/lic/uprop.pyc

# 重新压缩egg文件
RUN cd /root && zip -rq pyovpn-2.0-py3.12.egg pyovpn EGG-INFO common

# 将修改后的egg文件移动回原来的位置
RUN mv /root/pyovpn-2.0-py3.12.egg /usr/local/openvpn_as/lib/python/pyovpn-2.0-py3.12.egg

# 清除临时文件
RUN rm -rf /root/pyovpn
