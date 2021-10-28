# copy this to root directory of data and ./resample_delete.sh
# ffmpeg required
# https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop
# if you want to change the suffix '-8k.wav' into '.wav', then:
# find . -name '*-8k.wav' -exec bash -c 'mv $0 ${0/-8k/}' {} \;

open_sem(){
    mkfifo pipe-$$
    exec 3<>pipe-$$
    rm pipe-$$
    local i=$1
    for((;i>0;i--)); do
        printf %s 000 >&3
    done
}
run_with_lock(){
    local x
    read -u 3 -n 3 x && ((0==x)) || exit $x
    (
     ( "$@"; )
    printf '%.3d' $? >&3
    )&
}
resample_delete(){
    echo $1
    ffmpeg -loglevel panic -i "$1" -ar 8000 "${1%.*}-8k.wav"
    rm $1
}

N=32
open_sem $N
for f in $(find . -name "*.wav"); do
    run_with_lock resample_delete "$f"
done
