import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:task11_hotel_reservation_ui/models/extras.dart';
import 'package:task11_hotel_reservation_ui/models/rooms.dart';

String assetsPath = 'assets/images';
DateTime checkInDate = DateTime.now();
DateTime checkOutDate = DateTime.now();
double adultNumber = 0;
double childNumber = 0;
//extras
List<Extras> extras = [
  Extras(id: 1, extraName: "Breakfast (10 USD/Day)"),
  Extras(id: 2, extraName: "Internet wifi (5 USD/Day)"),
  Extras(id: 3, extraName: "Parking (5 USD/Day)"),
  Extras(id: 4, extraName: "Swimming Pool (10 USD/Day)"),
];
var items = extras
    .map((extra) => MultiSelectItem<Extras>(extra, extra.extraName))
    .toList();
List<Extras> selectedExtras = [];
//views options
String? selectedOption;
List<String> radioOptions = ['City View', 'Sea View', 'Museum View'];

//=================AppBar Start=================================================
PreferredSizeWidget app_bar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.orangeAccent,
    titleTextStyle: TextStyle(fontSize: 25.0, color: Colors.white),
  );
}

//=======================AppBar End=============================================
Text app_text({
  String text = '',
  double fontSize = 16,
  Color color = Colors.deepOrange,
  FontWeight fontWeight = FontWeight.bold,
  String fontFamily = '',
}) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color),
  );
}

//=====================Date Picker Start========================================
Future<void> selectDate(
    BuildContext context, Function? setStateCallBack, String type) async {
  final DateTime? picked = await showDatePicker(
      helpText: 'Select your Booking date',
      cancelText: 'Not Now',
      confirmText: "Book",
      fieldLabelText: 'Booking Date',
      fieldHintText: 'Month/Date/Year',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
      initialDate: type == 'CheckIn' ? checkInDate : checkOutDate,
      firstDate: DateTime(2023, 5),
      lastDate: DateTime(2030));
  if (picked != null &&
      picked != (type == 'CheckIn' ? checkInDate : checkOutDate)) {
    print(picked);
    if (type == 'CheckIn') {
      checkInDate = picked;
    } else {
      checkOutDate = picked;
    }
    setStateCallBack!(() {});
  }
}

Widget date_picker(
    {required context,
    Function? setStateCallBack,
    String text = '',
    double fontSize = 16,
    Color color = Colors.deepOrange,
    FontWeight fontWeight = FontWeight.bold,
    IconData icon = Icons.calendar_month,
    Color iconColor = Colors.deepOrange,
    String type = 'CheckIn'}) {
  return Row(children: [
    Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    ),
    Text(
      '${type == 'CheckIn' ? checkInDate.year : checkOutDate.year} - ${type == 'CheckIn' ? checkInDate.month : checkOutDate.month}- ${type == 'CheckIn' ? checkInDate.day : checkOutDate.day}'
          .toString(),
      style: TextStyle(fontSize: 16.0, color: Colors.blue),
    ),
    IconButton(
        onPressed: () {
          selectDate(context, setStateCallBack, type);
        },
        icon: Icon(
          icon,
          color: iconColor,
        ))
  ]);
}
//=====================Date Picker End==========================================

//=====================Slider Start=============================================
Widget custom_slider(
    {String text = '',
    String type = '',
    Function? setStateCallBack,
    int division = 6,
    double min = 0,
    double max = 6}) {
  return Row(
    children: [
      app_text(text: text),
      app_text(text: type == 'adult' ? '$adultNumber' : '$childNumber'),
      Expanded(
        flex: 1,
        child: Slider(
            value: type == 'adult' ? adultNumber : childNumber,
            divisions: division,
            min: min,
            max: max,
            inactiveColor: Color.fromARGB(87, 158, 158, 158),
            activeColor: Colors.lightBlue,
            label:
                type == 'adult' ? '$adultNumber Adult' : '$childNumber Child',
            onChanged: (val) {
              type == 'adult' ? adultNumber = val : childNumber = val;
              setStateCallBack!(() {});
            }),
      ),
    ],
  );
}
//======================Slider End==============================================

//=======================MultiSelect Start======================================
Widget multi_select(BuildContext context) {
  return MultiSelectDialogField(
      title: Text('Extras'),
      buttonText: app_text(text: 'Extras:'),
      onConfirm: (val) {
        selectedExtras = val;
      },
      dialogWidth: MediaQuery.of(context).size.width * 0.7,
      dialogHeight: MediaQuery.of(context).size.width * 0.6,
      items: items,
      checkColor: Colors.white,
      backgroundColor: Colors.white,
      selectedColor: Colors.blue,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
      )

      // selectedColor: Colors.white,
      // onConfirm: (p0) {},
      );
}
//=======================MultiSelect End========================================

//========================Radio Button Start====================================
Widget radio_buttons_group(BuildContext context, Function? setStateCallBack) {
  return Column(
      children: radioOptions.map((option) {
    return RadioListTile(
      fillColor: MaterialStatePropertyAll(Colors.blue),
      title: Text(option),
      value: option,
      groupValue: selectedOption,
      onChanged: (value) {
        setStateCallBack!(() {});
        selectedOption = value;
      },
    );
  }).toList());
}

//=========================Radio Button End=====================================