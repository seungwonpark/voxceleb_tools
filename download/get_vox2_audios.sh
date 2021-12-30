# if VOX_USER is not set
if [ -z "$VOX_USER" ]; then
    echo "VOX_USER is not set"
    exit 1
fi
# if VOX_PASSWD is not set
if [ -z "$VOX_PASSWD" ]; then
    echo "VOX_PASSWD is not set"
    exit 1
fi
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partaa
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partab
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partac
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partad
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partae
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partaf
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partag
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_dev_aac_partah
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox2_test_aac.zip

cat vox2_dev_aac* > vox2_aac.zip
rm vox2_dev_aac*
unzip vox2_aac.zip
unzip vox2_test_aac.zip
