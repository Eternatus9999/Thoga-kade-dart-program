import 'dart:io';

class FileService {
  Future<bool> saveData(String filePath, String data, {bool append = true}) async {
    try {
      final file = File(filePath);
      await file.writeAsString(
        data,
        mode: append ? FileMode.append : FileMode.write,
      );
      print('Data saved successfully.');
      return true;
    } catch (e) {
      print('Error saving data: $e');
      return false;
    }
  }

  Future<String> loadData(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        return await file.readAsString();
      } else {
        print('File does not exist.');
        return '';
      }
    } catch (e) {
      print('Error loading data: $e');
      return '';
    }
  }

  Future<void> backupData(String sourcePath, String backupPath) async {
    try {
      final sourceFile = File(sourcePath);
      final backupFile = File(backupPath);
      if (await sourceFile.exists()) {
        await backupFile.writeAsBytes(await sourceFile.readAsBytes());
        print('Data backed up successfully.');
      } else {
        print('Source file does not exist.');
      }
    } catch (e) {
      print('Error backing up data: $e');
    }
  }
}
