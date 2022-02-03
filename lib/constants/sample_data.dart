import 'package:ticket_marketplace/models/history_model.dart';
import 'package:ticket_marketplace/models/ticket_model.dart';

const sampleImgUrl =
    "https://lh3.googleusercontent.com/WwYd8uvCYPoNIFzENIqvaqWqHRBl82y3zSBNIiHor_529YFXMy_fT889BAWC987Kb3qLahffUNOb7rPFsZM3CC7C=s0";
final sampleTicket = TicketModel(
    ownedBy: "0x123456789",
    id: "#0001",
    name: "Flirty Bears",
    description:
        "He ordered his regular breakfast. Two eggs sunnyside up, hash browns, and two strips of bacon. He continued to look at the menu wondering if this would be the day he added something new. This was also part of the routine. A few seconds of hesitation to see if something else would be added to the order before demuring and saying that would be all. It was the same exact meal that he had ordered every day for the past two years.",
    location: "Ho Chi Minh City",
    category: "Concert",
    start: DateTime.now(),
    end: DateTime.now(),
    imageUrl: sampleImgUrl,
    histories: [
      History(from: "0x28345567", to: "0x182733829", date: DateTime.now()),
      History(from: "0x28345567", to: "0x182733829", date: DateTime.now()),
      History(from: "0x28345567", to: "0x182733829", date: DateTime.now())
    ]);
