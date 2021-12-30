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
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox1_dev_wav_partaa
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox1_dev_wav_partab
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox1_dev_wav_partac
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox1_dev_wav_partad
wget --user $VOX_USER --password $VOX_PASSWD http://mm.kaist.ac.kr/voxceleb/vox1a/vox1_test_wav.zip

cat vox1_dev* > vox1_dev_wav.zip
rm vox1_dev_wav_part*
unzip vox1_dev_wav.zip
unzip vox1_test_wav.zip
