import 'car.dart';

class DieselCar extends Car {
  String? carType;
  double? price;
  String? carModel;
  double? fuelTankCapacity;
  DieselCar(
      {required String color,
      String? manufactureYear,
      double? motorSpeed,
      required this.fuelTankCapacity,
      this.price,
      this.carModel,
      this.carType})
      : super(
            color: color,
            manufactureYear: manufactureYear,
            motorSpeed: motorSpeed);
  @override
  void showCarInfo() {
    print("==============Diesel Car Info===========");
    print("Car Type Is=> $carType");
    print("Car Price Is=> $price");
    print("Car Model Is=> $carModel");
    print("Car Fuel Tank Capacity Is=> $fuelTankCapacity");
    super.showCarInfo();
  }
}
