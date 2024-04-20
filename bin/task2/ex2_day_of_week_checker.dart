/// this is a dart application to check the day of the week
void main() {
  String day = 'Wednesday';
  switch (day) {
    case 'Saturday':
      print("Choosen Day Is Saturday");
      break;
    case 'Sunday':
      print("Choosen Day Is Sunday");
      break;
    case 'Monday':
      print("Choosen Day Is Monday");
      break;
    case 'Tuesday':
      print("Choosen Day Is Tuesday");
      break;
    case 'Wednesday':
      print("Choosen Day Is Wednesday");
      break;
    case 'Thursday':
      print("Choosen Day Is Thursday");
      break;
    case 'Friday':
      print("Choosen Day Is Friday");
      break;
    default:
      print(
          'Warrning !! Invalid Day => make sure you write first letter in capital case ');
  }
}
