import 'package:bus_seats_layout_demo/bottom_button.dart';
import 'package:bus_seats_layout_demo/button_controller.dart';
import 'package:bus_seats_layout_demo/colors.dart';
import 'package:bus_seats_layout_demo/decoration.dart';
import 'package:bus_seats_layout_demo/economy_seat_layout.dart';
import 'package:bus_seats_layout_demo/executive_seat_layout.dart';
import 'package:bus_seats_layout_demo/seat_layout_builder.dart';
import 'package:bus_seats_layout_demo/seat_selection_controller.dart';
import 'package:bus_seats_layout_demo/seat_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({
    Key? key,
  }) : super(key: key);
  static String id = '/SeatSelectionScreen';

  // -- Controllers

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    // void bookSeats() async {
    //   final Map<String, dynamic> bus =
    //       widget.busSnapshot!.data() as Map<String, dynamic>;

    //   final updatedData = {
    //     'bookedSeats': [
    //       ...bus['bookedSeats'] as List<dynamic>,
    //       ...selectedSeats
    //     ]
    //   };
    //   busBookingController.busSeatsList.value =
    //       bus['bookedSeats'] as List<dynamic>;
    //   busBookingController.reference.value = widget.busSnapshot!.reference.id;

    //   await widget.busSnapshot!.reference.update(updatedData);

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Seats booked successfully'),
    //     ),
    //   );
    // }

    final SeatSelectionController seatSelectionController =
        Get.put(SeatSelectionController());

    final Size size = MediaQuery.of(context).size;

    // final Map<String, dynamic> bus =
    //     widget.busSnapshot!.data() as Map<String, dynamic>;

    // var ticketPriceFromDB = bus["ticketPrice"];

    // var ticketPrice = ticketPriceFromDB.toDouble();

    // final bookedSeats = bus['bookedSeats'] as List<dynamic>;
    // final destination = bus["destination"] as String;
    // final busClass = bus["busClass"] as String;
    const String busClass = "ECONOMY";
    final ButtonController buttonController = Get.put(ButtonController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seat Selection Screen"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SeatStatus(
                    boxColor: emptySeatColor,
                    iconLabel: 'Available',
                    border: Border.all(
                      color: selectedSeatColor,
                    ),
                  ),
                  SeatStatus(
                    iconLabel: 'Selected',
                    boxColor: selectedSeatColor,
                  ),
                  SeatStatus(
                    boxColor: bookedSeatColor,
                    iconLabel: 'Booked',
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: size.height,
                width: size.width - 50,
                decoration: kBackgroundBoxDecoration,
                child: SeatLayoutBuilder(
                  model: economyseatLayout,
                  seatSelectionController: seatSelectionController,
                  destination: "Accra",
                  selectedSeatList: seatSelectionController.userSelectedSeats,
                  amount: seatSelectionController.seatPrice,
                  busClass: busClass,
                  ticketPrice: 100.0,
                  bookedSeatsFromDB: const [],
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomSheet: Container(
        height: size.height * 0.15,
        decoration: const BoxDecoration(
          color: tWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.airline_seat_recline_extra,
                              size: 25.0, color: tBlueColor),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text('Selected Seat'),
                        ],
                      ),
                      Obx(
                        () => Text(
                          seatSelectionController.userSelectedSeats.join(" , "),
                          style: TextStyle(
                            color: selectedSeatColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.attach_money,
                              size: 18.0, color: tBlueColor),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Total Price'),
                        ],
                      ),
                      Obx(
                        () => Text(
                          'GH¢${seatSelectionController.seatPrice.value}',
                          style: TextStyle(
                            color: selectedSeatColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BottomButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                bottomTextLabel: 'PROCEED TO PAYMENT',
                loadingIcon: Obx(
                  () => SizedBox(
                    child: buttonController.isButtonClicked.value == true
                        ? const CircularProgressIndicator(color: tWhiteColor)
                        : const Text(""),
                  ),
                ),
                onPressed: () {
                  if (seatSelectionController.isSeatSelected.value == true) {
                    buttonController.isButtonClicked.value = true;

                    // var totalSeatPrice =
                    //     seatSelectionController.seatPrice.value;

                    // showAlertDialog(size, totalSeatPrice);
                  } else {
                    Get.defaultDialog(
                        title: "Hey, Select atleast one seat to continue!");
                  }
                },
                height: size.width * 0.15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<SeatSelectionController>();
    // seatSelectionController.dispose();
    super.dispose();
  }
}
