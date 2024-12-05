import 'dart:io';
import '../Cli.dart';
import '../models/Vegetable.dart';
import '../services/FileService.dart';

class ThogaKadeManager {
  constructor() {}

  Future<void> addVegetable() async {
    print("Enter Vegetable id");
    String? id = stdin.readLineSync();
    if (id == null || id == "") {
      print("Enter Valid id");
      id = stdin.readLineSync();
    } else {
      print("Enter Vegetable name");
      String? name = stdin.readLineSync();
      if (name == null || name == "") {
        print("Enter Valid name");
        name = stdin.readLineSync();
      } else {
        print("Enter Vegetable pricePerKg");
        double? pricePerKg = double.tryParse(stdin.readLineSync()!);
        if (pricePerKg == null || pricePerKg == "") {
          print("Enter Valid pricePerKg");
          pricePerKg = double.tryParse(stdin.readLineSync()!);
        } else {
          print("Enter Vegetable availableQuantity");
          double? availableQuantity = double.tryParse(stdin.readLineSync()!);
          if (availableQuantity == null || availableQuantity == "") {
            print("Enter Valid availableQuantity");
            availableQuantity = double.tryParse(stdin.readLineSync()!);
          } else {
            print("Enter Vegetable category");
            String? category = stdin.readLineSync();
            if (category == null || category == "") {
              print("Enter Valid category");
              category = stdin.readLineSync();
            } else {
              print("Enter Vegetable expiryDate(DD/MM/YYYY)");
              String? expiryDate = stdin.readLineSync();
              if (expiryDate == null || expiryDate == "") {
                print("Enter Valid expiryDate");
                expiryDate = stdin.readLineSync();
              } else {
                Vegetable vegetable = new Vegetable(id, name, pricePerKg,availableQuantity, category, expiryDate);
                if(await FileService().saveData("inventory.txt",vegetable.toJson())){
                  print("Vegetable added successfully!");
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
}
