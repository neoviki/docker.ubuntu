mkdir -p archive/ubuntu
cp src/* archive/ubuntu/
cd archive
tar -czvf ubuntu.tar.gz ubuntu
rm -rf ubuntu
