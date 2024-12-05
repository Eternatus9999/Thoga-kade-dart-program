import 'dart:io';

import '../Cli.dart';

class InventoryManager {

  viewInventory(){
    print(File("inventory.txt").readAsStringSync()); 
    print('\nPress enter to go back');
    String? input = stdin.readLineSync();
    if(input != null){
      new Cli().run();
    }
  }
}