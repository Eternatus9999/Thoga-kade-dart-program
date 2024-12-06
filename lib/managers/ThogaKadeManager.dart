import 'dart:io';
import '../Cli.dart';
import '../models/Item.dart';
import '../models/Order.dart';
import '../services/FileService.dart';
import 'InventoryManager.dart';

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
                Item item = new Item(id, name, pricePerKg, availableQuantity,
                    category, expiryDate);
                if (await FileService().saveData("inventory.txt", item.toString())) {
                  print("Item added successfully!");
                  print("Do you want to add another Item? (yes/no)");
                  String? choice = stdin.readLineSync();
                  if (choice == "yes" || choice == "y") {
                    Cli().clearConsole();
                    addItem();
                  } else {
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

  Future<void> removeItem() async {
    String itemlist = InventoryManager().getInventory();
    List<String> list = itemlist.split("|");
    print(itemlist);
    print("Enter the id of the item you want to remove");
    var id = stdin.readLineSync();
    if (id == null || id == "" || int.parse(id) - 1 > list.length) {
      print("Enter Valid id");
      Cli().clearConsole();
      removeItem();
    } else {
      for (int i = 0; i < list.length; i++) {
        if (i == int.parse(id) - 1) {
          list.removeAt(i);
          break;
        }
      }
      if(await InventoryManager().editInventory(list)){
      print("Item removed successfully!");
      print("Do you want to remove another Item? (yes/no)");
      String? choice = stdin.readLineSync();
      if (choice == "yes" || choice == "y") {
        Cli().clearConsole();
        removeItem();
      } else {
        Cli().clearConsole();
        Cli().run();
      }
      }
    }
  }

  Future<void> placeOrder() async {
    print("Enter Order ID");
    String? id = stdin.readLineSync();
    if (id == null || id == "") {
      Cli().clearConsole();
      print("Enter Valid id");
      id = stdin.readLineSync();
      
    } else {
      print("Enter Item ID");
      String? itemid = stdin.readLineSync();
      if (itemid == null || itemid == "") {
        Cli().clearConsole();
        print("Enter Valid id");
        itemid = stdin.readLineSync();
        
      } else {
        print("Enter Quantity");
        double? qty = double.tryParse(stdin.readLineSync()!);
        if (qty == null || qty == "") {
          Cli().clearConsole();
          print("Enter Valid Quantity");
          qty = double.tryParse(stdin.readLineSync()!);
          
        } else {
          Order order = new Order(id, itemid, qty, InventoryManager().getItemById(itemid, qty));
          if (await FileService().saveData("orderHistory.txt", order.toString())) {
            print("Order placed successfully!");
            print("Do you want to place another Order? (yes/no)");
            String? choice = stdin.readLineSync();
            if (choice == "yes" || choice == "y") {
              Cli().clearConsole();
              placeOrder();
            } else {
              Cli().clearConsole();
              Cli().run();
            }
          }
        }
      }
    }     
  }

  void viewOrderHistory(){
    print(FileService().loadData("orderHistory.txt"));
    print("Press Enter to go back to the main menu");
    stdin.readLineSync();
    Cli().clearConsole();
    Cli().run();
  }
}
