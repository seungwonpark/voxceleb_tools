import os
import glob
import tqdm
import argparse


def main(args):
    video_paths = glob.glob(os.path.join(args.root_directory, '**', f'*.{args.video_extension}'), recursive=True)
    print(f'Number of video files with {args.video_extension} under {args.root_directory}: {len(video_paths)}')

    for video in tqdm.tqdm(video_paths):
        frames_folder = os.path.splitext(video)[0]
        os.makedirs(frames_folder, exist_ok=True)

        if args.fps == -1:
            command = f'ffmpeg -loglevel panic -i {video} -qscale:v 8 {os.path.join(frames_folder, "%05d.jpg")}'
        else:
            command = f'ffmpeg -loglevel panic -i {video} -r {args.fps} -qscale:v 8 {os.path.join(frames_folder, "%05d.jpg")}'
        os.system(command)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-r', '--root_directory', type=str, required=True)
    parser.add_argument('--fps', type=float, default=-1)
    parser.add_argument('--video_extension', type=str, default='mp4')
    
    args = parser.parse_args()
    main(args)
