1. Add Logo to Video (cho add nhiều ảnh)
2. Crop Video
3. Rotate Video
4. Images to Video (with music)
5. Extract Image from Video

Recent project

http://api.mp3.zing.vn/api/streaming/audio/Z6W9C78W/320


ffmpeg -referer "https://soundcloud.com/" -i "https://cf-hls-media.sndcdn.com/playlist/zXXofkLIn5yG.128.mp3/playlist.m3u8?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiKjovL2NmLWhscy1tZWRpYS5zbmRjZG4uY29tL3BsYXlsaXN0L3pYWG9ma0xJbjV5Ry4xMjgubXAzL3BsYXlsaXN0Lm0zdTgqIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjc4NDM0MzI3fX19XX0_&Signature=XbjCIZ5CSa1y53vn5nzdE79607c-9Pct0sxuZhiB3uDwtLBh7i4X6rIb3pZGJ6i7B5w1fYzOnaDin9jCLBgvqNTK~qcYLal7qvoLq7rKD5zPVBo0M~Mpmo~xAgN7BSLOaoaxxgYGjno8HrfDxRYJXzMYc151OmOHjDMI1Hk9TXR0zc92HlFUvsvS7xaVsCX9R4vQO1HefdDKItju5XhKK~n6UQmFFl8XoAtpT7F3pDmCU7xJZFqEWImoS9x1oZy0MJVmrEPXCDQKgGlwJypyTG42ZTWryAqLnFQ2kObVFmQkoJuAVZghoemklSuYzKKBkZ6E5ss41-DTzGcInyfwCg__&Key-Pair-Id=APKAI6TU7MMXM5DG6EPQ&track_authorization=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJnZW8iOiJWTiIsInN1YiI6IiIsInJpZCI6IjE3Mzg2ODZhLTA0YjctNGQ5MC1iZjgxLTgxMGJkOTgyMTZhMiIsImlhdCI6MTY3ODQzMzY0OH0.eMJO21Ljv6iiNhjGoEtKVE4Do5iFNmP4s1DQyc5VQzY" -c copy "test.mp3"


ffmpeg -i "https://cf-hls-media.sndcdn.com/playlist/HCIRUTU7r1ir.128.mp3/playlist.m3u8?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiKjovL2NmLWhscy1tZWRpYS5zbmRjZG4uY29tL3BsYXlsaXN0L0hDSVJVVFU3cjFpci4xMjgubXAzL3BsYXlsaXN0Lm0zdTgqIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjc4NTA0MzU1fX19XX0_&Signature=WMSt~gHDeunEklap~kR1Es9ZghhxvsJ5ZAJNkMFRKq9Q4S9eQ3LZD3Ik1bRZRt92fRLe4WQS8IZs0r9yNdRRQow3~TucVd-T1lvwC48xX0a0b-83DbuKXnndhM90~hFb6nXDMbEzWblO0xDO2PbMAxED2QEy612N9PFStFYcGAohUZBNs2zCY~9zzoKn7rlQFQYS9-klrsOupDZrVzjNhYfuFCYNSOx2kWlnTup~tCAvDnaLKTETPZSsy15fC3OUS12~rUTLZjBWGH3Cpbo6CEJuXxNH6ujhrZx-TDiCV5w2z5SAnAZPnw2UoixjpsWcdUrM2yN9FAPIQ6RWm0ccCw__&Key-Pair-Id=APKAI6TU7MMXM5DG6EPQ&track_authorization=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJnZW8iOiJWTiIsInN1YiI6IjEyMjkxNDQ3NTUiLCJyaWQiOiIiLCJpYXQiOjE2Nzg1MDQwMDV9.7r3TwAjxSUDA0PvfUN7dKdv7etLu1mL7UrW9bEdjPP0" -c copy "test.mp3"


ffmpeg -i 000.mp3 -i imgg.jpeg -c copy -map 0 -map 1 output000.mp3


audiowaveform -i zing.mp3 -o test.png -w 10000 -h 200 --waveform-color ffffff --no-axis-labels

audiowaveform -i test.mp3 -o zing_data.json --pixels-per-second 1



"-i \"" + path + "\" -vn -ac 1 -filter:a aresample=myNum -map 0:a -c:a pcm_s16le -f data -";


ffmpeg -i test.mp3 -vn -ac 1 -filter:a aresample=44100 -map 0:a -c:a pcm_s16le -f data out.txt

ffmpeg -y  -i test.mp3  -acodec pcm_s16le -f s16le -ac 1 -ar 16000 output.pcm

ffprobe -v error -f lavfi -i "amovie=test.mp3,asetnsamples=44100,astats=metadata=1:reset=2" -show_entries frame_tags=lavfi.astats.Overall.Max_level,lavfi.astats.Overall.Min_level, -of json > output.json

ffprobe -v error -f lavfi -i "amovie=test.mp3,asetnsamples=44100,astats=metadata=1:reset=1" -show_entries frame=pkt_pts_time:frame_tags=lavfi.astats.Overall.all -of csv=p=0 > output2.json


ffprobe -v error -f lavfi -i "amovie='test.mp3',asetnsamples=22050,astats=metadata=1:reset=1" -show_entries frame=pkt_pts_time:frame_tags=lavfi.astats.Overall.Peak_level -of csv=p=0 > output2.txt




ffprobe -v error -f lavfi -i "amovie=15.mp3,asetnsamples=44100,astats=metadata=1:reset=1" -show_entries frame_tags=lavfi.astats.Overall.Max_level,lavfi.astats.Overall.Min_level -of csv=p=0 > 15m_1.txt


ffprobe -v error -f lavfi -i "amovie='15m_1.mp3',asetrate=r=44100,asetnsamples=n=44100:p=0,astats=metadata=1:reset=1" -show_entries frame=pkt_pts_time:frame_tags=lavfi.astats.Overall.Max_level,lavfi.astats.Overall.Min_level -of json > output2.txt

        "-v error -f lavfi -i \"amovie='${music.musicFile.path}',asetnsamples=$asetnsamples,astats=metadata=1:reset=1\" -show_entries frame=pkt_pts_time:frame_tags=lavfi.astats.Overall.Max_level,lavfi.astats.Overall.Min_level";
