import 'dart:io';
import '../Cli.dart';
import '../models/Item.dart';
import '../services/FileService.dart';

class ThogaKadeManager {
  constructor() {}

  Future<void> addItem() async {
    print("Enter Item id");
    String? id = stdin.readLineSync();
    if (id == null || id == "") {
      print("Enter Valid id");
      id = stdin.readLineSync();
    } else {
      print("Enter Item name");
      String? name = stdin.readLineSync();
      if (name == null || name == "") {
        print("Enter Valid name");
        name = stdin.readLineSync();
      } else {
        print("Enter Item pricePerKg");
        double? pricePerKg = double.tryParse(stdin.readLineSync()!);
        if (pricePerKg == null || pricePerKg == "") {
          print("Enter Valid pricePerKg");
          pricePerKg = double.tryParse(stdin.readLineSync()!);
        } else {
          print("Enter Item availableQuantity");
          double? availableQuantity = double.tryParse(stdin.readLineSync()!);
          if (availableQuantity == null || availableQuantity == "") {
            print("Enter Valid availableQuantity");
            availableQuantity = double.tryParse(stdin.readLineSync()!);
          } else {
            print("Enter Item category");
            String? category = stdin.readLineSync();
            if (category == null || category == "") {
              print("Enter Valid category");
              category = stdin.readLineSync();
            } else {
              print("Enter Item expiryDate(DD/MM/YYYY)");
              String? expiryDate = stdin.readLineSync();
              if (expiryDate == null || expiryDate == "") {
                print("Enter Valid expiryDate");
                expiryDate = stdin.readLineSync();
              } else {
                Item item = new Item(id, name, pricePerKg,availableQuantity, category, expiryDate);
                if(await FileService().saveData("inventory.txt",item.toJson())){
                  print("Item added successfully!");
                print("Do you want to add another Item? (yes/no)");
                String? choice = stdin.readLineSync();
                if (choice == "yes") {
                  Cli().clearConsole();
                  addItem();
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

  viewInventory(){
    
  }
}
