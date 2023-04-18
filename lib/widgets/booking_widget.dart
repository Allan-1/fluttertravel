import 'package:flutter/material.dart';

import '../screens/payment_screen.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({Key? key}) : super(key: key);

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  int dropdownvalue = 1;
  var items = [1,2,3,4,5,6,7,8,9,10];
  dateTimeRangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: DateTimeRange(
          end: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 13),
          start: DateTime.now(),
        ),
        builder: (context, child) {
          return Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400.0,
                ),
                child: child,
              )
            ],
          );
        });
    print(picked);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const Text("Select the duration of Stay", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:  OutlinedButton(onPressed: (){dateTimeRangePicker();}, child: const Text("Select Date")),
          ),
          const SizedBox(height: 10,),
          const Text("Number of people", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
         const TextField(keyboardType: TextInputType.number,),
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const PaymentScreen();
                  },
                ),
              );
            }, child: const Text("Continue To Book")),
          )
        ],
      ),
    );
  }
}
