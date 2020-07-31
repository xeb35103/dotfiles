dest_dir=~/tmpWork
if [ -d ${dest_dir} ]; then
    echo ${dest_dir} is exist
else
    mkdir ${dest_dir}
    sudo mount /dev/sdb1 ${dest_dir}
fi
cd ~
ln -s  ${dest_dir}/bin bin
ln -s  ${dest_dir}/doc doc
ln -s  ${dest_dir}/memo memo
ln -s  ${dest_dir}/mono mono
ln -s  ${dest_dir}/pio pio
ln -s  ${dest_dir}/processing processing

