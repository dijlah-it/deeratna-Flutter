import 'package:deeratna/Components/my_cart.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:deeratna/Pages/access_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationManagementPage extends StatefulWidget {
  const InformationManagementPage({
    super.key,
  });
  static String routName = "/InformationManagementPage";
  @override
  State<InformationManagementPage> createState() =>
      _InformationManagementPageState();
}

class _InformationManagementPageState extends State<InformationManagementPage> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint(arguments['editInformation'].toString());
    final List<dynamic> _children = ConstUserInformations.json?['children'];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.isDarkModeEnabled
          ? Constants.backGroundColorNight
          : Constants.backGroundColor,
      appBar: AppBar(
        backgroundColor: Constants.isDarkModeEnabled
            ? Constants.headerColorNight
            : Constants.headerColor,
        toolbarHeight: 60,
        iconTheme: IconThemeData(
          color: Constants.isDarkModeEnabled
              ? Constants.textColorNight
              : Constants.textColor,
        ),
        title: Align(
          child: Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Text(
              "بطاقة دخول",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.isDarkModeEnabled
                    ? Constants.textColorNight
                    : Constants.textColor,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Constants.isDarkModeEnabled
                        ? Constants.itemColorNight
                        : Constants.itemColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Constants.isDarkModeEnabled
                              ? Constants.headerColorNight
                              : Constants.headerColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            './Assets/images/41.svg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                              Constants.isDarkModeEnabled
                                  ? Constants.textColorNight
                                  : Constants.textColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: List.generate(
                            _children.length,
                            (index) => arguments['editInformation']
                                ? MyCart(
                                    title: _children[index]['name'],
                                    description: _children[index]['pivot']
                                        ['relation'],
                                    icon: GestureDetector(
                                      child: Icon(
                                        Icons.edit,
                                        size: 30,
                                        color: Constants.isDarkModeEnabled
                                            ? Constants.textColorNight
                                            : Constants.textColor,
                                      ),
                                      onTap: () {
                                        debugPrint(index.toString());
                                      },
                                    ),
                                  )
                                : MyCart(
                                    title: _children[index]['name'],
                                    description: _children[index]['pivot']
                                        ['relation'],
                                    icon: GestureDetector(
                                      child: Icon(
                                        Icons.add_task_sharp,
                                        size: 30,
                                        color: Constants.isDarkModeEnabled
                                            ? Constants.textColorNight
                                            : Constants.textColor,
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, AccessCard.routName,
                                            arguments: {
                                              'username': _children[index]
                                                  ['name']
                                            });
                                      },
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AccessCard.routName,
                  arguments: {
                    'editInformation': true,
                    'username': 'mohammad',
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Constants.isDarkModeEnabled
                      ? Constants.itemColorNight
                      : Constants.itemColor;
                }),
              ),
              child: Text(
                "اضافة",
                style: TextStyle(
                  fontFamily: 'Jazeera-Regular',
                  color: Constants.isDarkModeEnabled
                      ? Constants.textColorNight
                      : Constants.textColor,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
