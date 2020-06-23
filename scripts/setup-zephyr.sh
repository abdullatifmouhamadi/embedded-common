#!/bin/bash

# https://docs.zephyrproject.org/latest/getting_started/index.html
# https://docs.zephyrproject.org/latest/guides/west/repo-tool.html


#west init zephyrproject
#cd zephyrproject
#west update

#west zephyr-export
#pip install --user -r zephyr/scripts/requirements.txt


#rm -rf zephyr-workspace
mkdir -p workspace\
				 workspace/manifest-repo\
				 workspace/app1\
				 workspace/app2


cp -r ../../common/scripts/setup-zephyr/basic/* workspace/app1/
cp -r ../../common/scripts/setup-zephyr/basic/* workspace/app2/


cat << EOF > ./workspace/.gitignore
bootloader/
build/
modules/
tools/
zephyr/
EOF



cat << EOF > ./workspace/manifest-repo/west.yml
manifest:
  remotes:
    - name: zephyrproject-rtos
      url-base: https://github.com/zephyrproject-rtos
    - name: your-git-server
      url-base: https://git.example.com/your-company
  defaults:
    remote: your-git-server
  projects:
    - name: zephyr
      remote: zephyrproject-rtos
      revision: master
      import: true
    - name: app1
      path: ./app1
    - name: app2
      path: ./app2
  self:
    path: manifest-repo
EOF

cd workspace
west init -l manifest-repo
west update
west zephyr-export







