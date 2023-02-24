**FFMPEG TEXT**


1. Thêm text tại 1 toạ độ

```c
ffmpeg -i video.mp4 -vf "drawtext=text='My text starting at 640x360':x=640:y=360:fontsize=24:fontcolor=white" -c:a copy output.mp4
```

2. Text có background

```c
ffmpeg -i video.mp4 -vf "drawtext=text='© Krishna':x=(1100-text_w):y=(600-text_h):fontsize=32:fontcolor=black:box=1:boxcolor=blue@0.5: boxborderw=50" -c:a copy output.mp4
```

3. Text di chuyển giống movie credit

```c
ffmpeg -i video.mp4 -vf "drawtext=text='Xin chao cac ban, toi là Vinh
Mot dong mơi
Dong 3': x=200: y=h-80*t: fontsize=36:fontcolor=yellow@0.9: box=1: boxcolor=black@0.6" -c:a copy outputCredits.mp4
```

4. Hiển thị thời gian video

```c
ffmpeg -i video.mp4 -vf "drawtext=text='%{pts\:gmtime\:0\:%M\\\\\:%S}': x=300: y=300: fontsize=32:fontcolor=yellow@0.9: box=1: boxcolor=black@0.6" -c:a copy output.mp4
```

5. Hiển thị text trong khoảng thời gian

Hiển thị text từ giây 3s đến 8s
```c
ffmpeg -i video.mp4 -vf "drawtext=text='© Krishna':x=(1100-text_w):y=(600-text_h):fontsize=32:fontcolor=black:box=1:boxcolor=blue@0.5: boxborderw=50:enable='between(t,2.2,8)'" -c:a copy output2.mp4
```

```c
ffmpeg -i video.mp4 -vf "drawtext=text='© Krishna':x=(1100-text_w):y=(600-text_h):fontsize=32:fontcolor=black:box=1:boxcolor=blue@0.5: boxborderw=50:enable='lt(mod(t,1),1)'" -c:a copy output.mp4
```

6. Crop Video

```c
ffmpeg -i video.mp4 -filter:v "crop=500:500:0:0" out.mp4
```

7. Draw nhiều text

```c
ffmpeg -i video.mp4 -vf "drawtext=text='© Krishna':x=(1100-text_w):y=(600-text_h):fontsize=32:fontcolor=black:box=1:boxcolor=blue@0.5: boxborderw=50, drawtext=text='Vinh':x=0:y=0 :fontsize=32:fontcolor=black:box=1:boxcolor=green@0.5: boxborderw=20" -c:a copy output3.mp4
```

```c
ffmpeg -i video.mp4 -vf "drawtext=text='Text 1':x=200:y=200 :fontsize=32:fontcolor=black:box=1:boxcolor=blue@0.5: boxborderw=50: enable='between(t,1,4)', drawtext=text='Text 2':x=200:y=200 :fontsize=32:fontcolor=black:box=1:boxcolor=green@0.5: boxborderw=20: enable='between(t,4,7)'" -c:a copy output3.mp4
```



8. Rotate video

- 0 = 90 Counter Clockwise and Vertical Flip (default)
- 1 = 90 Clockwise
- 2 = 90 Counter Clockwise
- 3 = 90 Clockwise and Vertical Flip

```c
ffmpeg -i video.mp4 -vf "transpose=1" rotate.mp4
```


9. Add Logo to Video

```c
ffmpeg -i video.mp4 -i logo.png -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.5[logo1]; [logo1]scale=512:512,rotate=0*PI/180: c=none: ow=rotw(iw): oh=roth(ih)[rotate1]; [0:v][rotate1]overlay=0:0" -codec:a copy output_logo2.mp4
```

```c
ffmpeg -i video.mp4 -i logo6.png -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.5[logo1]; [logo1]scale=420:120, rotate=30*PI/180: c=none: ow=424:oh=314[rotate]; [0:v][rotate]overlay=W/2-424/2:H/2-314/2" -codec:a copy output_logo5.mp4
```

```c
ffmpeg -i video.mp4 -i logo6.png -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.5[logo1]; [logo1]scale=iw:ih, rotate=0*PI/180: c=none: ow=abs(ih*sin(0*PI/180)) + abs(iw*cos(0*PI/180)): oh=abs(ih*cos(0*PI/180)) + abs(iw*sin(0*PI/180))[rotate]; [0:v][rotate]overlay=100:100" -codec:a copy output_logo5.mp4
```

```c
ffmpeg -i video.mp4 -i logo.png -i logo.png -filter_complex "[1]format=rgba,colorchannelmixer=aa=0.5[logo1]; [logo1]scale=200:200,rotate=45*PI/180: c=none: ow=rotw(iw): oh=roth(ih)[rotate1]; [0:v][rotate1]overlay=500:500[vid1]; [2]format=rgba,colorchannelmixer=aa=0.5[logo2]; [logo2]scale=200:200,rotate=0*PI/180: c=none: ow=rotw(iw): oh=roth(ih)[rotate2]; [vid1][rotate2]overlay=100:100" -codec:a copy output_logo2.mp4
```