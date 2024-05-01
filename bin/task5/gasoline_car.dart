import 'car.dart';

class GasolineCar extends Car {
  double? fuelTankCapcity;
  GasolineCar({required color, double? motorSpeed, this.fuelTankCapcity})
      : super(color: color, motorSpeed: motorSpeed);
  @override
  void showMotorSpeed() {
    print("============Gasoline Car Motor Speed========");
    print("Gasoline Car Motor Speed is=> $motorSpeed");
    //super.showMotorSpeed();
  }
}
