class Car {
  //String carModel = '';
  String? color;
  double? motorSpeed;
  String? manufactureYear;
  Car({required this.color, this.manufactureYear, this.motorSpeed});
  void showMotorSpeed() {
    print("The Car Motor Speed =  $motorSpeed");
  }

  void showCarInfo() {
    print("Car Info ========================");
    print("Car Color is => $color");
    print("Car motor speed is => $motorSpeed");
    print("Car manfacture year is => $manufactureYear");
  }
}
