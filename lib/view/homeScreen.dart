import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorter/providers/numbersProvider.dart';
import 'package:sorter/utils/widgets.dart';
import 'package:sorter/view/sortingPage.dart';

import '../providers/sortingProvider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> algorithms = ['Bubble Sort', 'Insertion Sort', 'Selection Sort'];
  String selectedAlgo = 'Bubble Sort';
  TextEditingController numController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sortingProvider =
        Provider.of<SortingProvider>(context, listen: false);
    print('build');
    return Scaffold(
        backgroundColor: Colors.brown.shade200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.black45, BlendMode.colorBurn),
                        image: AssetImage("images/sortback2.png"))),
              ),
            ),
            title: const Text(
              'SORTER',
              style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 7.0,
                  fontWeight: FontWeight.w900),
            ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
          ),
        ),
        body: Consumer<NumbersProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.lightBlueAccent,
                      border: Border.all(color: Colors.orangeAccent, width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  child: value.numbers.length == 12
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customText(
                              text: 'Select Sorting Algorithm',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: DropdownButtonFormField<String>(
                                  value: selectedAlgo,
                                  isExpanded: false,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent, width: 2),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade500,
                                  ),
                                  items: algorithms
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          )))
                                      .toList(),
                                  onChanged: (item) => setState(() {
                                    selectedAlgo = item.toString();
                                  }),
                                ),
                              ),
                            ),
                            button(
                                fun: () {
                                  sortingProvider.addNumbers(value.numbers);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) => SortingPage(
                                                numbers: value.numbers,
                                                sortingName: selectedAlgo,
                                              ))).then((val) {
                                    value.reset();
                                  });
                                },
                                text: 'Sort Numbers'),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customText(text: 'Select numbers upto two digits'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: value.curnum == ""
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 100,
                                              child: TextFormField(
                                                maxLength: 2,
                                                controller: numController,
                                                onChanged: (val) {
                                                  value.curNum(val);
                                                },
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.brown.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor:
                                                    Colors.orangeAccent,
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors
                                                            .yellowAccent), //<-- SEE HERE
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors
                                                            .orangeAccent), //<-- SEE HERE
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 100,
                                              child: TextFormField(
                                                maxLength: 2,
                                                onChanged: (val) {
                                                  value.curNum(val);
                                                },
                                                controller: numController,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.brown.shade700,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                cursorColor:
                                                    Colors.orangeAccent,
                                                decoration: InputDecoration(
                                                  counterText: "",
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors
                                                            .yellowAccent), //<-- SEE HERE
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors
                                                            .orangeAccent), //<-- SEE HERE
                                                  ),
                                                ),
                                              ),
                                            ),
                                            button(
                                              text: 'Next',
                                              fun: () {
                                                if (numController
                                                    .text.isNotEmpty) {
                                                  value.addNum(int.parse(
                                                      numController.text
                                                          .toString()));
                                                  value.curNum("");
                                                  numController.clear();
                                                }
                                              },
                                            ),
                                          ],
                                        )),
                            ),
                          ],
                        ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 8, left: 8, right: 8),
                      child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 7,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: Colors.orangeAccent, width: 3),
                              borderRadius: BorderRadius.circular(20)),
                          child: value.numbers.isEmpty
                              ? Container(
                                  child: Image(
                                    image: AssetImage('images/empty.png'),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 8),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 5.0,
                                    ),
                                    itemCount: value.numbers.length,
                                    itemBuilder: (context, index) {
                                      return NumbersBox(
                                        num: value.numbers[index],
                                      );
                                    },
                                  ),
                                )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 220,
                          height: 35,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              color: Colors.brown,
                              border: Border.all(
                                  color: Colors.orangeAccent, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Selected Numbers',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
