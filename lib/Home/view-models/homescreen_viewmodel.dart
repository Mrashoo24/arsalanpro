import 'package:arsalanpro/Home/models/taskmodel.dart';
import 'package:arsalanpro/Home/repo/sharedpref.dart';
import 'package:arsalanpro/Utils/constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenViewModel extends GetxController {
  bool isLoading =  true;

  List<TaskModel> taskModelToday = [];
  List<TaskModel> taskModelTomorrow = [];
  List<TaskModel> taskModelUpcoming = [];

  @override
  onInit() {
    super.onInit();
    SharedPrefCustom.getShared();
    getTodayTaskList();
    getTomorrowTaskList();
    getUpcomingTaskList();
  }

  setTodayTask(TaskModel value){
    taskModelToday.add(value);
    SharedPrefCustom.setTaskToPref('today', taskModelToday);
    print('today task = $taskModelToday');
    update();
    Get.snackbar('Task', 'Updated',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);

  }

  setTomorrowTask(TaskModel value){
    taskModelTomorrow.add(value);
    SharedPrefCustom.setTaskToPref('tomorrow', taskModelTomorrow);
    update();
    Get.snackbar('Task', 'Updated',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);
  }

  setUpcomingTask(TaskModel value){
    taskModelUpcoming.add(value);
    SharedPrefCustom.setTaskToPref('upcoming', taskModelUpcoming);
    update();
    Get.snackbar('Task', 'Updated',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);
  }

  removeTodayTask(int index){
    taskModelToday.removeAt(index);
    SharedPrefCustom.setTaskToPref('today', taskModelToday);
    print('today task = $taskModelToday');
    update();
    Get.snackbar('Task', 'Deleted',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);

  }

  removeTomorrowTask(int index){
    taskModelTomorrow.removeAt(index);
    SharedPrefCustom.setTaskToPref('tomorrow', taskModelTomorrow);
    update();
    Get.snackbar('Task', 'Deleted',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);
  }

  removeUpcomingTask(int index){
    taskModelUpcoming.removeAt(index);
    SharedPrefCustom.setTaskToPref('upcoming', taskModelUpcoming);
    update();
    Get.snackbar('Task', 'Deleted',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);
  }

  updateTodayTask(TaskModel value,index){
    taskModelToday[index] = value;
    // taskModelToday.add(value);
    SharedPrefCustom.setTaskToPref('today', taskModelToday);
    print('today task = $taskModelToday');
    update();
    Get.snackbar('Task', 'Updated',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);

  }

  updateTomorrowTask(TaskModel value,int index){
    taskModelTomorrow[index] = value;
    SharedPrefCustom.setTaskToPref('tomorrow', taskModelTomorrow);
    update();
    Get.snackbar('Task', 'Updated',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);
  }

  updateUpcomingTask(TaskModel value,int index){
    taskModelUpcoming[index] = value;
    SharedPrefCustom.setTaskToPref('upcoming', taskModelUpcoming);
    update();
    Get.snackbar('Task', 'Updated',snackPosition: SnackPosition.BOTTOM,backgroundColor: kwhite,colorText: kred);
  }



  getTodayTaskList() async {
    isLoading = true;
    update();
    taskModelToday = await SharedPrefCustom.getTaskFromPref('today') ?? [];
    isLoading = false;
    update();
  }

  getTomorrowTaskList() async {
    isLoading = true;
    update();
    taskModelTomorrow = await SharedPrefCustom.getTaskFromPref('tomorrow') ?? [];
    isLoading = false;
    update();
  }

  getUpcomingTaskList() async {
    isLoading = true;
    update();
    taskModelUpcoming = await SharedPrefCustom.getTaskFromPref('upcoming') ?? [];
    isLoading = true;
    update();

  }



}
