import 'package:flutter/material.dart';
import 'package:travo_app/core/constants/dismension_constants.dart';
import 'package:travo_app/core/helpers/asset_helper.dart';
import 'package:travo_app/representaiton/screen/hotel_booking_screen.dart';
import 'package:travo_app/representaiton/widgets/app_bar_container.dart';
import 'package:travo_app/representaiton/widgets/button_widget.dart';
import 'package:travo_app/representaiton/widgets/item_add_guest_and_room.dart';

class GuestAndRoomBookingScreenState extends StatefulWidget {
  const GuestAndRoomBookingScreenState({Key? key}) : super(key: key);

  static const String routeName = '/guest_and_room_booking_screen';

  @override
  State<GuestAndRoomBookingScreenState> createState() =>
      __GuestAndRoomBookingScreenStateState();
}

class __GuestAndRoomBookingScreenStateState
    extends State<GuestAndRoomBookingScreenState> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Add Guest And Room',
      implementLoading: true,
      onBackButtonPressed: () {
        Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
      },
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding,
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.icoGuest,
            innitData: 2,
            title: 'Gest',
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.icoRoom,
            innitData: 1,
            title: 'Room',
          ),
          ButtonWidget(
            title: 'Done',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
