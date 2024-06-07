import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travo_app/core/constants/dismension_constants.dart';
import 'package:travo_app/core/helpers/asset_helper.dart';
import 'package:travo_app/core/helpers/image_helper.dart';
import 'package:travo_app/representaiton/screen/hotel_booking_screen.dart';

import 'package:travo_app/representaiton/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _builtItemCategory(
    Widget icon,
    Color color,
    Function() onTap,
    String title,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            child: icon,
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(kItemPadding)),
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi User',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                'Where are you going next?',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            FontAwesomeIcons.bell,
            size: kDefaultIconSize,
            color: Colors.white,
          ),
          SizedBox(
            width: kMediumPadding,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                kItemPadding,
              ),
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: ImageHelper.loadFromAsset(
              AssetHelper.person,
            ),
          ),
        ]),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search you destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultPadding,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(
                    kItemPadding,
                  ))),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: _builtItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoHotel,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    Color(0xffF77777), () {
                  Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                }, 'Hotles'),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _builtItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icoPlane,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  Color(0xffF77777),
                  () {},
                  'Flights',
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _builtItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoHotelPlane,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    Color(0xffF77777),
                    () {},
                    'All'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
