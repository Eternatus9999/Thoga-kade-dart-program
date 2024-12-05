import 'dart:io';

class FileService {
  Future<bool> saveData(String filePath, String data, {bool append = true}) async {
    try {
      final file = File(filePath);
      await file.writeAsString(
        data,
        mode: append ? FileMode.append : FileMode.write,
      );
      return true;
    } catch (e) {
      print('Error saving data: $e');
      return false;
    }
  }

  Future<bool> ReWrite(String filePath, String data, {bool append = false}) async {
    try {
      final file = File(filePath);
      await file.writeAsString(
        data,
        mode: append ? FileMode.append : FileMode.write,
      );
      return true;
    } catch (e) {
      print('Error saving data: $e');
      return false;
    }
  }

  String loadData(String filePath) {
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        return File("Inventory.txt").readAsStringSync().toString();
      } else {
        print('File does not exist.');
        return '';
      }
    } catch (e) {
      print('Error loading data: $e');
      return '';
    }
  }

}
