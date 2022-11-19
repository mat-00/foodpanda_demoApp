import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpanda_demo/Components/restaurant.dart';
import 'package:foodpanda_demo/constants/colors.dart';
import 'package:foodpanda_demo/constants/constants.dart';
import 'package:foodpanda_demo/dashboard/detail_screen.dart';
import 'package:foodpanda_demo/Model/panda_model/exclusiveHelper.dart';
import 'package:foodpanda_demo/Model/panda_model/exclusive_item_model.dart';
import 'package:foodpanda_demo/Model/panda_pick_model/pandaPickHelper.dart';
import 'package:foodpanda_demo/Model/panda_pick_model/pandaPickItemModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
        text: 'Search for restaurant,cuisones, and dishes');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery'),
        actions: const [
          Icon(Icons.shopping_bag_outlined),
          SizedBox(
            width: 10,
          )
        ],

      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Panda Pick',
                style: TextStyle(
                    color: Color(0xff323232), fontSize: 25, fontFamily: Bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .278,
                  child: ListView.builder(
                      itemCount: PandaPickHelper.itemCount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        PandaPickItemModel model =
                            PandaPickHelper.getStatusItem(index);
                        return RestaurentScreen(
                          name: model.name,
                          image: model.image,
                          remainingTime: model.remaingTime,
                          totalRating: model.totalRating,
                          subTitle: model.subTitle,
                          rating: model.ratting,
                          deliveryTime: model.remaingTime,
                          deliveryPrice: model.deliveryPrice,
                        );
                      }),
                ),
              ),
              Text(
                'Panda exclusives',
                style: TextStyle(
                    color: Color(0xff323232), fontSize: 15, fontFamily: Bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .278,
                  child: ListView.builder(
                      itemCount: ExclusiveHelper.itemCount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        ExclusiveItemModel model =
                            ExclusiveHelper.getStatusItem(index);
                        return RestaurentScreen(
                          name: model.name,
                          image: model.image,
                          remainingTime: model.remaingTime,
                          totalRating: model.totalRating,
                          subTitle: model.subTitle,
                          rating: model.rating,
                          deliveryTime: model.remaingTime,
                          deliveryPrice: model.deliveryPrice,
                        );
                      }),
                ),
              ),
              Text(
                'All Restuarent',
                style: TextStyle(
                    color: Color(0xff323232), fontSize: 15, fontFamily: Bold),
              ),
              SingleChildScrollView(
                child: Container(
                  height: height * 0.4,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                      itemCount: ExclusiveHelper.itemCount,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) {
                        ExclusiveItemModel model =
                            ExclusiveHelper.getStatusItem(index);
                        return RestaurentScreen(
                          name: model.name,
                          image: model.image,
                          remainingTime: model.remaingTime,
                          totalRating: model.totalRating,
                          subTitle: model.subTitle,
                          rating: model.rating,
                          deliveryTime: model.remaingTime,
                          deliveryPrice: model.deliveryPrice,
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
