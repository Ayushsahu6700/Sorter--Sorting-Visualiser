import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sorter/providers/sortingProvider.dart';

import '../utils/widgets.dart';

class SortingPage extends StatefulWidget {
  static String routeName = '/sortingscreen';
  List<int> numbers = [];
  String sortingName = '';
  SortingPage({required this.numbers, required this.sortingName});

  @override
  State<SortingPage> createState() => _SortingPageState();
}

class _SortingPageState extends State<SortingPage>
    with SingleTickerProviderStateMixin {
  List<int> numbers = [1, 4, 5, 2, 3];

  @override
  void initState() {
    // TODO: implement initState
    numbers = widget.numbers;
    // final sortingProvider = Provider.of<SortingProvider>(context, listen: true);
    // sortingProvider.addNumbers(widget.numbers);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sortingProvider = Provider.of<SortingProvider>(context, listen: true);
    if (sortingProvider.sorted == 1) {
      Future.delayed(
          Duration.zero,
          () => QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'All Numbers Are Sorted',
              ));
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          if (sortingProvider.sorted != 1) {
            if (widget.sortingName == 'Bubble Sort') {
              sortingProvider.bubbleSort();
            } else if (widget.sortingName == 'Insertion Sort') {
              sortingProvider.insertionSort();
            } else {
              sortingProvider.selectionSort();
            }
          }
        },
        child: sortingProvider.sorted != 1
            ? Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Start',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                sortingProvider.reset();
                Navigator.of(context).pop();
              }),
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      colorFilter:
                          ColorFilter.mode(Colors.black45, BlendMode.colorBurn),
                      image: AssetImage("images/sortback2.png"))),
            ),
          ),
          title: Text(
            widget.sortingName.toString(),
            style: TextStyle(
                fontSize: 35, letterSpacing: 4.0, fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
        ),
      ),
      body: Stack(
        children: [
          Consumer<SortingProvider>(builder: (context, value, child) {
            // if (value.sorted == 1) {
            //   showDialog(
            //       context: context,
            //       builder: (context) {
            //         Future.delayed(Duration(seconds: 5), () {
            //           Navigator.popUntil(context, (route) => route.isFirst);
            //         });
            //         return AlertDialog(
            //           title: Row(
            //             mainAxisAlignment: MainAxisAlignment.end,
            //             children: [
            //               IconButton(
            //                 icon: Icon(
            //                   Icons.close,
            //                   size: 30,
            //                 ),
            //                 onPressed: () {
            //                   Navigator.popUntil(
            //                       context, (route) => route.isFirst);
            //                 },
            //               ),
            //             ],
            //           ),
            //           content: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               // Lottie.asset("assets/success.json", fit: BoxFit.fill),
            //               SizedBox(
            //                 height: 15,
            //               ),
            //               FittedBox(
            //                 child: Text(
            //                   'Marked As Delivered',
            //                   style: TextStyle(fontSize: 30),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       });
            // }
            return Padding(
              padding:
                  const EdgeInsets.only(top: 12, bottom: 8, left: 8, right: 8),
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.orangeAccent, width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
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
                            if (index == value.n1 || index == value.n2) {
                              return TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0.0, end: 15.0),
                                duration: Duration(milliseconds: 500),
                                builder: (BuildContext context, double val,
                                    Widget? child) {
                                  return NumbersBox2(
                                    color: Colors.redAccent,
                                    padding: val,
                                    num: value.numbers[index],
                                  );
                                },
                              );
                            } else {
                              return NumbersBox2(
                                padding: 0.0,
                                color: (index == value.n1 || index == value.n2)
                                    ? Colors.redAccent
                                    : Colors.orangeAccent,
                                num: value.numbers[index],
                              );
                            }
                          },
                        ),
                      ),
                      if (value.key != -1) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'KEY:',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                            Text(
                              value.key.toString(),
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                          ],
                        )
                      ] else if (value.minNum != -1) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Min Number:',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                            Text(
                              value.minNum.toString(),
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown),
                            ),
                          ],
                        )
                      ] else ...[
                        Container()
                      ],
                      button(
                          fun: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context) =>
                                    buildsheet(widget.sortingName));
                          },
                          text: "Code Details")
                    ],
                  )),
            );
          }),
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
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: Colors.brown,
                    border: Border.all(color: Colors.orangeAccent, width: 3),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Sorteded Numbers',
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
    );
  }

  Widget buildsheet(String algo) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Code:',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (algo == 'Bubble Sort') ...[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage('images/bubblesort.png'),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Time Complexity: ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'O(N^2)',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Space Complexity: ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'O(1)',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ],
                      ),
                    ] else if (algo == 'Insertion Sort') ...[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage('images/insertionsort.png'),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Time Complexity: ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'O(N^2)',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Space Complexity: ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'O(1)',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ],
                      ),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage('images/selectionsort.png'),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Time Complexity: ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'O(N^2)',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Space Complexity: ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'O(1)',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
