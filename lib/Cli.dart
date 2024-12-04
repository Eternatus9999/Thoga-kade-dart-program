import 'dart:io';

class Cli {

  constructor() {
    
  }

void _clearConsole() {
  stdout.write("\x1B[2J\x1B[H");
}


  void run(){
  print(r"""
    ████████╗██╗  ██╗ ██████╗  ██████╗  █████╗     ██╗  ██╗ █████╗ ██████╗ ███████╗
    ╚══██╔══╝██║  ██║██╔═══██╗██╔════╝ ██╔══██╗    ██║ ██╔╝██╔══██╗██╔══██╗██╔════╝
       ██║   ███████║██║   ██║██║  ███╗███████║    █████╔╝ ███████║██║  ██║█████╗  
       ██║   ██╔══██║██║   ██║██║   ██║██╔══██║    ██╔═██╗ ██╔══██║██║  ██║██╔══╝  
       ██║   ██║  ██║╚██████╔╝╚██████╔╝██║  ██║    ██║  ██╗██║  ██║██████╔╝███████╗
       ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝"""
  );

  print(r"""

      1. View Inventory
      2. Add Vegetable
      3. Remove Vegetable
      4. Process Order
      5. View Order History
      6. Exit
 """);
    var input = stdin.readLineSync();
    if(input == '1'){
      _viewInventory();
    }
    else if(input == '2'){
      print('Add Vegetable');
    }
    else if(input == '3'){
      print('Remove Vegetable');
    }
    else if(input == '4'){
      print('Process Order');
    }
    else if(input == '5'){
      print('View Order History');
    }
    else if(input == '6'){
      print('Exit');
      exit(0);
    }
    else{
      print('Invalid Input');
    }
}
  void _viewInventory(){
    _clearConsole();
    print(r"""/n
██╗   ██╗██╗███████╗██╗    ██╗     ██╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗████████╗ ██████╗ ██████╗ ██╗   ██╗
██║   ██║██║██╔════╝██║    ██║     ██║████╗  ██║██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝
██║   ██║██║█████╗  ██║ █╗ ██║     ██║██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║   ██║   ██║   ██║██████╔╝ ╚████╔╝ 
╚██╗ ██╔╝██║██╔══╝  ██║███╗██║     ██║██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ██║   ██║██╔══██╗  ╚██╔╝  
 ╚████╔╝ ██║███████╗╚███╔███╔╝     ██║██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║   ██║   ╚██████╔╝██║  ██║   ██║   
  ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝      ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
""");
  }
  void addVegitable(){
    _clearConsole();
    print(r"""/n
 █████╗ ██████╗ ██████╗     ██╗   ██╗███████╗ ██████╗ ██╗████████╗ █████╗ ██████╗ ██╗     ███████╗███████╗
██╔══██╗██╔══██╗██╔══██╗    ██║   ██║██╔════╝██╔════╝ ██║╚══██╔══╝██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝
███████║██║  ██║██║  ██║    ██║   ██║█████╗  ██║  ███╗██║   ██║   ███████║██████╔╝██║     █████╗  ███████╗
██╔══██║██║  ██║██║  ██║    ╚██╗ ██╔╝██╔══╝  ██║   ██║██║   ██║   ██╔══██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║██████╔╝██████╔╝     ╚████╔╝ ███████╗╚██████╔╝██║   ██║   ██║  ██║██████╔╝███████╗███████╗███████║
╚═╝  ╚═╝╚═════╝ ╚═════╝       ╚═══╝  ╚══════╝ ╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚══════╝

  """);
  }

  void removeVegitable(){
    _clearConsole();
    print(r"""/n
██████╗ ███████╗███╗   ███╗ ██████╗ ██╗   ██╗███████╗    ██╗   ██╗███████╗ ██████╗ ██╗████████╗ █████╗ ██████╗ ██╗     ███████╗███████╗
██╔══██╗██╔════╝████╗ ████║██╔═══██╗██║   ██║██╔════╝    ██║   ██║██╔════╝██╔════╝ ██║╚══██╔══╝██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝
██████╔╝█████╗  ██╔████╔██║██║   ██║██║   ██║█████╗      ██║   ██║█████╗  ██║  ███╗██║   ██║   ███████║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ██║╚██╔╝██║██║   ██║╚██╗ ██╔╝██╔══╝      ╚██╗ ██╔╝██╔══╝  ██║   ██║██║   ██║   ██╔══██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗██║ ╚═╝ ██║╚██████╔╝ ╚████╔╝ ███████╗     ╚████╔╝ ███████╗╚██████╔╝██║   ██║   ██║  ██║██████╔╝███████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝      ╚═══╝  ╚══════╝ ╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚══════╝   
""");
  }
}
