import 'package:flutter/material.dart';
import 'package:travo_app/core/constants/dismension_constants.dart';
import 'package:travo_app/core/helpers/asset_helper.dart';
import 'package:travo_app/representaiton/screen/guest_and_room_booking_screen.dart';
import 'package:travo_app/representaiton/screen/hotel_screen.dart';
import 'package:travo_app/representaiton/screen/select_date_screen.dart';
import 'package:travo_app/representaiton/widgets/app_bar_container.dart';
import 'package:travo_app/representaiton/widgets/button_widget.dart';
import 'package:travo_app/representaiton/widgets/item_booking_widget.dart';
import 'package:travo_app/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        titleString: 'Hotel Booking',
        implementLoading: true,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              ImtemBookingWidget(
                icon: AssetHelper.icoLocation,
                title: 'Destination',
                description: 'Korea',
                onTap: () {},
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              ImtemBookingWidget(
                icon: AssetHelper.icoCalendal,
                title: 'Select date',
                description: dateSelected ?? '12 Feb - 20 Feb 2024',
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(SelectDateScreen.routeName);
                  if (!(result as List<DateTime?>)
                      .any((element) => element == null)) {
                    dateSelected =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                    setState(() {});
                  }
                },
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              ImtemBookingWidget(
                icon: AssetHelper.icoBed,
                title: 'Guest and room',
                description: '2 Guest , 1 Room',
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(GuestAndRoomBookingScreenState.routeName);
                },
              ),
              SizedBox(
                height: kDefaultPadding * 2,
              ),
              ButtonWidget(
                title: 'Search',
                onTap: () {
                  Navigator.of(context).pushNamed(HotelScreen.routeName);
                },
              )
            ],
          ),
        ));
  }
}
