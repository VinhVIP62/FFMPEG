void main() {
  double step = 1;

  List<MyText> texts = [];
  // for (double i = 0; i < 5; i += step) {
  //   final text = MyText(
  //     text: "Một hai bảy tám chín - Text ${i.toStringAsFixed(1)}",
  //     x: 0,
  //     y: 0,
  //     textSize: 40,
  //     textColor: "0xff0000",
  //     startTime: i.toDouble(),
  //     endTime: (i + step).toDouble(),
  //     alpha: 0.5,
  //     isEnableBox: 1,
  //     boxColor: "0x00ff00",
  //     boxAlpha: 0.0,
  //     boxBorderW: 20,
  //     shadowColor: "0x0000ff",
  //     shadowX: 2,
  //     shadowY: 2,
  //   );

  //   texts.add(text);
  // }

  final textFade = MyText(
    text: "Dòng chữ Fade in - Fade out",
    x: 200,
    y: 200,
    textSize: 40,
    textColor: "0x000000",
    startTime: 2,
    endTime: 12,
    alpha: 0.5,
    isEnableBox: 0,
    boxColor: "0x00ff00",
    boxAlpha: 0.0,
    boxBorderW: 20,
    shadowColor: "0x0000ff",
    shadowX: 2,
    shadowY: 2,
    animType: "fade",
    introLength: 4, 
    outroLength: 4,
  );

  final textSlide = MyText(
    text: "Dòng chữ chạy từ trái qua phải",
    x: 200,
    y: 400,
    textSize: 40,
    textColor: "0x000000",
    startTime: 2,
    endTime: 12,
    alpha: 0.5,
    isEnableBox: 0,
    boxColor: "0x00ff00",
    boxAlpha: 0.0,
    boxBorderW: 20,
    shadowColor: "0x0000ff",
    shadowX: 2,
    shadowY: 2,
    animType: "slide",
    introLength: 4,
    outroLength: 4
  );

  final textZoom = MyText(
    text: "Zoom out - Zoom in",
    x: 400,
    y: 600,
    textSize: 40,
    textColor: "0x000000",
    startTime: 2,
    endTime: 12,
    alpha: 0.5,
    isEnableBox: 0,
    boxColor: "0x00ff00",
    boxAlpha: 0.0,
    boxBorderW: 20,
    shadowColor: "0x0000ff",
    shadowX: 2,
    shadowY: 2,
    animType: "zoom",
    introLength: 4,
    outroLength: 4
  );


  texts.add(textFade);
  texts.add(textSlide);
  texts.add(textZoom);

  final cmd = multipleTextCommand(texts, "video.mp4", "output_text.mp4");
  print(cmd);
}

String multipleTextCommand(
    List<MyText> texts, String inputVideoPath, String outputVideoPath) {
  String cmd = 'ffmpeg -i $inputVideoPath -vf "';

  for (int i = 0; i < texts.length; i++) {
    var text = texts[i];
    var introEnd = text.startTime + text.introLength;
    var outroStart = text.endTime - text.outroLength;

    cmd += 'drawtext=text=\'${text.text}\'';

    if (text.animType == "slide") {
      var dis = 150;
      cmd +=
          ':x=\'if(between(t, ${text.startTime}, $introEnd), ${text.x} - (($introEnd-t)/${text.introLength} * $dis), if(between(t, $outroStart, ${text.endTime}), ${text.x} + ((t-$outroStart)/${text.outroLength}*$dis), ${text.x}))\':y=${text.y}';
    } else {
      cmd += ':x=${text.x}:y=${text.y}';
    }

    /// text style
    if(text.animType == "zoom") {
        cmd += ':fontsize=\'if(between(t, ${text.startTime}, $introEnd), ${text.textSize} * (1 + 4 * ($introEnd-t)/${text.introLength}), ${text.textSize})\':fontcolor=${text.textColor}';
    }else{
        cmd += ':fontsize=${text.textSize}:fontcolor=${text.textColor}';
    }
    

    if (text.animType == "fade") {
      /// Fade in/out
      cmd +=
          ':alpha=\' if(between(t, ${text.startTime}, $introEnd), (t-${text.startTime})/${text.introLength}, if(between(t,$outroStart,${text.endTime}), (${text.endTime}-t)/${text.outroLength}, 1))  \'';
    }

    /// border text style
    cmd += ':borderw=1: bordercolor=blue@0.5';

    /// shadow text
    cmd +=
        ':shadowcolor=${text.shadowColor}: shadowx=${text.shadowX}: shadowy=${text.shadowY}';

    /// Vẽ theo cái box phía ngoài
    cmd += ':fix_bounds=1';

    /// background style (box style)
    if (text.isEnableBox == 1) {
      cmd +=
          ':box=1: boxcolor=${text.boxColor}@${text.boxAlpha} :boxborderw=${text.boxBorderW}';
    }

    /// time show text
    cmd += ' :enable=\'between(t, ${text.startTime}, ${text.endTime})\'';

    if (i < texts.length - 1) {
      cmd += ', ';
    }
  }

  cmd += '" -c:a copy $outputVideoPath';

  return cmd;
}

class MyText {
  final String text;
  final double x, y;
  final double textSize;
  final String textColor;
  final double startTime, endTime;
  final double alpha;

  /// Background box style
  final int isEnableBox;
  final String boxColor;
  final double boxAlpha;
  final double boxBorderW;

  /// Shadow Style
  final String shadowColor;
  final double shadowX, shadowY;

  // Animation
  final String animType;
  final double introLength, outroLength;

  MyText({
    required this.text,
    required this.x,
    required this.y,
    required this.textSize,
    required this.textColor,
    required this.startTime,
    required this.endTime,
    required this.alpha,
    required this.isEnableBox,
    required this.boxColor,
    required this.boxAlpha,
    required this.boxBorderW,
    required this.shadowColor,
    required this.shadowX,
    required this.shadowY,
    required this.animType,
    required this.introLength,
    required this.outroLength,

  });
}
