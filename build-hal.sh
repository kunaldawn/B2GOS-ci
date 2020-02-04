#!/bin/bash
source b2g.env
cd $ANDROID_ROOT


source build/envsetup.sh
export USE_CCACHE=1
lunch full_onyx-eng 
make -j$(nproc) mkbootimg
make -j$(nproc) systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum $ANDROID_ROOT/out/target/product/onyx/boot.img
md5sum $ANDROID_ROOT/out/target/product/onyx/system.img
