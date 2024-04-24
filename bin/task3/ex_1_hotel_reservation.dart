import 'dart:io';

// Hotel Reservation System
final Map reservations = {};
//View Available Rooms
void viewAvailableRooms(List availableRooms) {
  print('Available rooms: $availableRooms');
}

// Make Reservation Function
void makeReservation(List availableRooms) {
  stdout.write('Enter your name: ');
  final guestName = stdin.readLineSync();
  stdout.write("Enter your phone number: ");
  final phoneNumber = stdin.readLineSync();
  stdout.write("Enter adults number: ");
  final adultsNumber = int.parse(stdin.readLineSync()!);
  stdout.write('Do you have children? (yes/no): ');
  final hasChildren = stdin.readLineSync()?.toLowerCase() == 'yes';
  stdout.write('Room preference (single/double): ');
  final roomPreference = stdin.readLineSync()?.toLowerCase();
  stdout.write("Enter number of days you will stay : ");
  final daysNumber = int.parse(stdin.readLineSync()!);
  stdout.write('Enter room number: ');
  final roomNumber = stdin.readLineSync();
  final reservationDate = DateTime.now();
  final departmentDate = reservationDate.add(Duration(days: daysNumber));
  if (availableRooms.contains(roomNumber)) {
    reservations[guestName!] = {
      'Room': roomNumber,
      'Name': guestName,
      'Phone': phoneNumber,
      'Children': hasChildren,
      'Adults': adultsNumber,
      'Room Preference': roomPreference,
      'Reservation Date': reservationDate,
      'Department Date': departmentDate
    };
    print('Reservation successful! Thank you, $guestName.');
  } else {
    print('Room $roomNumber is not available.');
  }
}

//View Reservations Function
void viewReservations() {
  if (reservations.isNotEmpty) {
    print('Current reservations:');
    for (final reserv in reservations.entries) {
      print('Name: ${reserv.key}');
      reserv.value.forEach((key, value) {
        print('$key: $value');
      });
    }
  } else {
    print("There is no reservations !!");
  }
}

void main() {
  final availableRooms = ['100', '101', '102', '103', '205'];

  print(
      '*====================(( Welcome to Our Hotel Reservation System ))===================*\n');

  while (true) {
    print('                                  **** Menu ****\n');
    print('**                             1. View available rooms');
    print('**                             2. Make a reservation');
    print('**                             3. View reservations');
    print('**                             4. Exit');
    print(
        "\n*===================================================================================*\n");
    stdout.write('Enter your choice: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        viewAvailableRooms(availableRooms);
      case '2':
        makeReservation(availableRooms);
      case '3':
        viewReservations();
      case '4':
        print('Thank you for using our reservation system.');
        return;
      default:
        print('Invalid choice. Please select a valid option.');
    }
  }
}
