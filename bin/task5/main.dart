import 'diesel_car.dart';
import 'gasoline_car.dart';

void main() {
  var dieselCar = DieselCar(
      color: 'Grey',
      fuelTankCapacity: 70,
      price: 500.000,
      manufactureYear: '2014',
      carModel: 'Maruti Swift ',
      motorSpeed: 180.0,
      carType: 'Used');
  dieselCar.showCarInfo();
  var gasolineCar =
      GasolineCar(color: 'Black', motorSpeed: 180.0, fuelTankCapcity: 50.0);
  gasolineCar.showMotorSpeed();
}
