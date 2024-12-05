import 'dart:io';
import '../Cli.dart';
import '../models/Vegetable.dart';

class ThogaKadeManager {
  constructor() {}

  void addVegetable() {
    print("Enter Vegitable id");
    String? id = stdin.readLineSync();
    if (id == null || id == "") {
      print("Enter Valid id");
      id = stdin.readLineSync();
    } else {
      print("Enter Vegitable name");
      String? name = stdin.readLineSync();
      if (name == null || name == "") {
        print("Enter Valid name");
        name = stdin.readLineSync();
      } else {
        print("Enter Vegitable pricePerKg");
        double? pricePerKg = double.tryParse(stdin.readLineSync()!);
        if (pricePerKg == null || pricePerKg == "") {
          print("Enter Valid pricePerKg");
          pricePerKg = double.tryParse(stdin.readLineSync()!);
        } else {
          print("Enter Vegitable availableQuantity");
          double? availableQuantity = double.tryParse(stdin.readLineSync()!);
          if (availableQuantity == null || availableQuantity == "") {
            print("Enter Valid availableQuantity");
            availableQuantity = double.tryParse(stdin.readLineSync()!);
          } else {
            print("Enter Vegitable category");
            String? category = stdin.readLineSync();
            if (category == null || category == "") {
              print("Enter Valid category");
              category = stdin.readLineSync();
            } else {
              print("Enter Vegitable expiryDate(DD/MM/YYYY)");
              String? expiryDate = stdin.readLineSync();
              if (expiryDate == null || expiryDate == "") {
                print("Enter Valid expiryDate");
                expiryDate = stdin.readLineSync();
              } else {
                Vegetable vegitable = new Vegetable(id, name, pricePerKg,availableQuantity, category, expiryDate);
                print("Vegitable added successfully!");
                print("Do you want to add another vegetable? (yes/no)");
                String? choice = stdin.readLineSync();
                if (choice == "yes") {
                  Cli().clearConsole();
                  addVegetable();
                }else{
                  Cli().clearConsole();
                  Cli().run();
                }
              }
            }
          }
        }
      }
    }
  }
}
