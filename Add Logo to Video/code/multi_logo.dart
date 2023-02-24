import 'dart:math';

void main() {
  final logo0 = RotationLogo(
    logoPath: "logo.png",
    sw: 200,
    sh: 200,
    alpha: 0.5,
    angle: 45*pi/180,
    ocx: 500,
    ocy: 500,
  );

  final logo1 = RotationLogo(
    logoPath: "logo1.png",
    sw: 420,
    sh: 120,
    alpha: 0.3,
    angle: 90*pi/180,
    ocx: 500,
    ocy: 500,
  );

  final List<RotationLogo> logos = [logo0, logo1];
  final cmd = multipleCommand(logos, "video.mp4", "out_mul.mp4");

  print(cmd);
}

String multipleCommand(
    List<RotationLogo> logos, String inputVideoPath, String outputVideoPath) {
  String cmd = 'ffmpeg -i $inputVideoPath ';
  for (int i = 0; i < logos.length; i++) {
    cmd += '-i ${logos[i].logoPath} ';
  }

  cmd += '-filter_complex "';

  for (int i = 0; i < logos.length; i++) {
    var logo = logos[i];
    String lastVideo = "";
    if (i == 0) {
      lastVideo = '0:v';
    } else {
      lastVideo = 'vid_${i - 1}';
    }

    String logoCmd =
        '[${i + 1}]format=rgba, colorchannelmixer=aa=${logo.alpha}[logo_$i]; ';

    logoCmd +=
        '[logo_$i]scale=${logo.sw}:${logo.sh}, rotate=${logo.angle}: c=none: ow=${logo.getOw()}: oh=${logo.getOh()}[rotate_$i]; ';

    logoCmd += '[$lastVideo][rotate_$i]overlay=${logo.getOx()}:${logo.getOy()}';

    if (i < logos.length - 1) {
      logoCmd += "[vid_$i]; ";
    }

    // Add logo cmd to main command
    cmd += logoCmd;
  }

  cmd += '" -codec:a copy $outputVideoPath';

  return cmd;
}

class RotationLogo {
  final String logoPath;

  final int sw, sh;             // Scale width, height          
  final double angle, alpha;    // Angle (in radian), alpha (0->1)
  final double ocx, ocy;        // Overlay central x,y (tâm của ảnh)

  RotationLogo({
    required this.logoPath,
    required this.sw,
    required this.sh,
    required this.angle,
    required this.alpha,
    required this.ocx,
    required this.ocy,
  });

  // Get overlay width
  double getOw() {
    return ((sh * sin(angle)) + (sw * cos(angle))).abs();
  }

  // Get overlay height
  double getOh() {
    return ((sh * cos(angle)) + (sw * sin(angle))).abs();
  }

  // Get overlay x (top left corner)
  double getOx() {
    return ocx - getOw() / 2;
  }

  // Get overlay y (top left corner)
  double getOy() {
    return ocy - getOh() / 2;
  }
}