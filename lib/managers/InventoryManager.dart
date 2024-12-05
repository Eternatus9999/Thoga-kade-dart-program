import 'dart:io';

import '../Cli.dart';
import '../services/FileService.dart';

class InventoryManager {

  viewInventory(){
    print(FileService().loadData("inventory.txt")); 
    print('\nPress enter to go back');
    String? input = stdin.readLineSync();
    if(input != null){
      new Cli().run();
    }
  }
  Future<bool> editInventory(List<String> input) async {
    await FileService().ReWrite("inventory.txt", "");
    for(int i = 0; i < input.length; i++){
      await FileService().saveData("inventory.txt", "${input[i]}|");
    }
    return true;
  }
  String getInventory(){
    return FileService().loadData("inventory.txt").toString();
  }
}