import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:puppy_spa/db/notes_database.dart';
import 'package:puppy_spa/models/note.dart';
import 'package:puppy_spa/ui/widgets/button.dart';

class ListController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }
}

var taskList = <AppLog>[].obs;

// Future<int> addApp({AppLog? appLog}) async {
//   return await NotesDatabase.insert(appLog);
// }

// void getApps() async {
//   List<Map<String, dynamic>> apps = await note
// }

