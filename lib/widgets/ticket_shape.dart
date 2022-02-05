import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_marketplace/constants/constants.dart';
import 'package:ticket_marketplace/constants/sample_data.dart';
import 'package:ticket_marketplace/screens/profile/confirm_sharing.dart';
import 'package:ticket_marketplace/screens/qr_share/qr_share_screen.dart';
import 'package:ticket_marketplace/utils/wallet.dart';
import 'package:ticket_marketplace/widgets/dashed_line.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class Ticket extends StatelessWidget {
  final double margin;
  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;

  const Ticket({
    Key? key,
    this.margin = 10,
    this.borderRadius = 10,
    this.clipRadius = 12.5,
    this.smallClipRadius = 5,
    this.numberOfSmallClips = 13,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ticketWidth = screenSize.width;
    final ticketHeight = screenSize.height - margin * 4;

    //Hard-code
    final txOutId =
        "609d2edf125ea7ca6459a9aff93bd7085d3fd508506d3b84dd504e64d330653f";
    return Container(
      width: ticketWidth,
      height: ticketHeight,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 37,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipPath(
        clipper: TicketClipper(
          borderRadius: borderRadius,
          clipRadius: clipRadius,
          smallClipRadius: smallClipRadius,
          numberOfSmallClips: numberOfSmallClips,
        ),
        child: Container(
          padding: EdgeInsets.all(clipRadius + 5),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flirty Bears",
                    style: blackColorFont.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: blueCustom),
                  ),
                  const SizedBox(height: 5),
                  const Text("Ho Chi Minh City, Vietnam", style: blackColorFont)
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start",
                        style: blackColorFont.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "12:00 PM",
                        style: blackColorFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "21/10/2022",
                        style: blackColorFont.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const FaIcon(
                    FontAwesomeIcons.ticketAlt,
                    color: blueCustom,
                    size: 20,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("End",
                          style: blackColorFont.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(
                        "5:00 PM",
                        style: blackColorFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "23/10/2022",
                        style: blackColorFont.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Image.network(
                    sampleImgUrl,
                    width: ticketWidth,
                    height: ticketHeight / 3,
                  ),
                ),
              ),
              const MySeparator(),
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: QrImage(
                    data: "flirtybears.com",
                    version: QrVersions.auto,
                    size: ticketWidth / 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: blueCustom),
                child: GestureDetector(
                  onTap: () async {
                    var result = await BarcodeScanner.scan();
                    if (result.type == ResultType.Barcode) {
                      // final signaturer = "await SignMsg(txOutId);";
                      // print(result.rawContent);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ConfirmSharing(
                      //           receiverPublicId: result.rawContent,
                      //           txOutId: txOutId,
                      //           signaturer: signaturer)),
                      // );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Share',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  static const double clipPadding = 18;

  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;

  const TicketClipper({
    required this.borderRadius,
    required this.clipRadius,
    required this.smallClipRadius,
    required this.numberOfSmallClips,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    final clipCenterY = size.height * 0.3 + clipRadius;

    // draw rect
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    ));

    final clipPath = Path();

    // circle on the left
    clipPath.addOval(Rect.fromCircle(
      center: Offset(0, clipCenterY),
      radius: clipRadius,
    ));

    // circle on the right
    clipPath.addOval(Rect.fromCircle(
      center: Offset(size.width, clipCenterY),
      radius: clipRadius,
    ));

    // combine two path together
    final ticketPath = Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );

    return ticketPath;
  }

  @override
  bool shouldReclip(TicketClipper old) =>
      old.borderRadius != borderRadius ||
      old.clipRadius != clipRadius ||
      old.smallClipRadius != smallClipRadius ||
      old.numberOfSmallClips != numberOfSmallClips;
}
