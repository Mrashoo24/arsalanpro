import 'package:arsalanpro/Home/models/taskmodel.dart';
import 'package:arsalanpro/Home/view-models/homescreen_viewmodel.dart';
import 'package:arsalanpro/Utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController searchTomorrowController = TextEditingController();
  TextEditingController searchUpcomingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: GetBuilder<HomeScreenViewModel>(
            init: Get.put(HomeScreenViewModel()),
            builder: (homeScreenViewModel) {
              return Scaffold(
                  backgroundColor: kscaffcolor,
                  appBar: AppBar(
                    backgroundColor: korange,
                    title: Text(
                      "Daily sheet",
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    bottom: TabBar(
                      indicatorColor: kwhite,
                      tabs: [
                        Tab(
                            child: tabcontent(
                                "Today", "Today Task", homeScreenViewModel)),
                        Tab(
                            child: tabcontent("Tommorow", 'Tomorrow Task',
                                homeScreenViewModel)),
                        Tab(
                            child: tabcontent("Upcoming", 'Upcoming Task',
                                homeScreenViewModel)),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      ///Today task
                      Container(
                        color: Colors.red,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: searchController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: kwhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: 'Search Task'),
                                onChanged: (value){
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                
                                itemCount:
                                searchController.text.isEmpty ? homeScreenViewModel.taskModelToday.length
                                  :
                                homeScreenViewModel.taskModelToday.where((element){
                                  return element.title!.toUpperCase().contains(searchController.text.toUpperCase());
                                }).toList().length
                                  ,
                                itemBuilder: (context, index) {


                                  return buildTaskCard(homeScreenViewModel, index,'today', searchController.text.isEmpty ? homeScreenViewModel.taskModelToday
                                      :
                                      homeScreenViewModel.taskModelToday.where((element){
                                    return element.title!.toUpperCase().contains(searchController.text.toUpperCase());
                                  }).toList());
                                }
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Tomorrow Task
                      Container(
                        color: Colors.green,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: searchTomorrowController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: kwhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: 'Search Task'),
                                onChanged: (value){
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount:
                                  searchTomorrowController.text.isEmpty ? homeScreenViewModel.taskModelTomorrow.length
                                      :
                                  homeScreenViewModel.taskModelTomorrow.where((element){
                                    return element.title!.toUpperCase().contains(searchTomorrowController.text.toUpperCase());
                                  }).toList().length
                                  ,
                                  itemBuilder: (context, index) {


                                    return buildTaskCard(homeScreenViewModel, index,'tomorrow', searchTomorrowController.text.isEmpty ? homeScreenViewModel.taskModelTomorrow
                                        :
                                    homeScreenViewModel.taskModelTomorrow.where((element){
                                      return element.title!.toUpperCase().contains(searchTomorrowController.text.toUpperCase());
                                    }).toList());
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Upcoming Task
                      Container(
                        color: Colors.orange,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: searchUpcomingController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: kwhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: 'Search Task'),
                                onChanged: (value){
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount:
                                  searchUpcomingController.text.isEmpty ? homeScreenViewModel.taskModelUpcoming.length
                                      :
                                  homeScreenViewModel.taskModelUpcoming.where((element){
                                    return element.title!.toUpperCase().contains(searchUpcomingController.text.toUpperCase());
                                  }).toList().length
                                  ,
                                  itemBuilder: (context, index) {


                                    return buildTaskCard(homeScreenViewModel, index,'upcoming', searchUpcomingController.text.isEmpty ? homeScreenViewModel.taskModelUpcoming
                                        :
                                    homeScreenViewModel.taskModelUpcoming.where((element){
                                      return element.title!.toUpperCase().contains(searchUpcomingController.text.toUpperCase());
                                    }).toList());
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }

  Padding buildTaskCard(HomeScreenViewModel homeScreenViewModel, int index,task,List<TaskModel> listoftask) {
    return Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 10, left: 10),
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2, color: Colors.black),
                                  color: kwhite),
                              child: Column(
                                children: [
                                  Text(
                                    listoftask[index].title ?? '',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(  listoftask[index].desc ?? ''),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            titleController.text = listoftask[index].title!;
                                            descController.text= listoftask[index].desc!;

                                            Get.defaultDialog(
                                              barrierDismissible: false,
                                                title: 'Edit ' + listoftask[index].title!,
                                                content: Form(
                                                  key: _formKey,
                                                  child: Column(children: [
                                                    TextFormField(
                                                      controller: titleController,
                                                      decoration: InputDecoration(
                                                          label: Text('Title'),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(10)),
                                                          hintText: 'Enter a title'),
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Title is required';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    TextFormField(
                                                      controller: descController,
                                                      maxLines: 4,
                                                      minLines: 1,
                                                      decoration: InputDecoration(
                                                          label: Text('Description'),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(10)),
                                                          hintText: 'Enter a Descrition'),
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Description is required';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            if (_formKey.currentState!.validate()) {
                                                              print('task = $task');
                                                              if (task == 'today') {
                                                                print('clicked today');
                                                                homeScreenViewModel.updateTodayTask(TaskModel(
                                                                    title: titleController.text,
                                                                    desc: descController.text),index);
                                                                titleController.clear();
                                                                descController.clear();

                                                                Navigator.of(Get.overlayContext!,
                                                                    rootNavigator: true)
                                                                    .pop();
                                                              } else if (task == 'tomorrow') {
                                                                print('clicked tomorow');
                                                                homeScreenViewModel.updateTomorrowTask(TaskModel(
                                                                    title: titleController.text,
                                                                    desc: descController.text),index);
                                                                titleController.clear();
                                                                descController.clear();

                                                                Navigator.of(Get.overlayContext!,
                                                                    rootNavigator: true)
                                                                    .pop();

                                                              } else {
                                                                print('clicked today');
                                                                homeScreenViewModel.updateUpcomingTask(TaskModel(
                                                                    title: titleController.text,
                                                                    desc: descController.text),index);
                                                                titleController.clear();
                                                                descController.clear();

                                                                Navigator.of(Get.overlayContext!,
                                                                    rootNavigator: true)
                                                                    .pop();
                                                              }
                                                            }
                                                          },
                                                          child: Card(
                                                            color: kgreen,
                                                            child: Padding(
                                                              padding: EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "Update",
                                                                style: TextStyle(color: kwhite),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            titleController.clear();
                                                            descController.clear();
                                                            Get.back();
                                                          },
                                                          child: Card(
                                                            color: korange,
                                                            child: Padding(
                                                              padding: EdgeInsets.all(8.0),
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(color: kwhite),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    )
                                                  ]),
                                                ));


                                          },
                                          icon: Icon(
                                            CupertinoIcons.pencil_circle_fill,
                                            semanticLabel: 'Edit Post',
                                            size: 40,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(title: 'Are you sure',middleText: ''
                                            , onConfirm: (){
                                                  if (task == 'today') {

                                                    print('clicked today');
                                                    homeScreenViewModel.removeTodayTask(index);

                                                    Navigator.of(Get.overlayContext!,
                                                        rootNavigator: true)
                                                        .pop();

                                                  } else if (task == 'tomorrow') {

                                                    homeScreenViewModel.removeTomorrowTask(index);

                                                    Navigator.of(Get.overlayContext!,
                                                        rootNavigator: true)
                                                        .pop();

                                                  } else {

                                                    homeScreenViewModel.removeUpcomingTask(index);

                                                    Navigator.of(Get.overlayContext!,
                                                        rootNavigator: true)
                                                        .pop();

                                                  }
                                                },onCancel:(){}
                                            );
                                          },
                                          icon: Icon(
                                            CupertinoIcons.pencil_slash,
                                            semanticLabel: 'Delete Post',
                                            size: 40,
                                            color: kred,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
  }

  Container tabcontent(days, task, HomeScreenViewModel homeviewmodel) {
    return Container(
      height: 40,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(days),
          InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: 'Add ' + task,
                    content: Form(
                      key: _formKey,
                      child: Column(children: [
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                              label: Text('Title'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter a title'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: descController,
                          maxLines: 4,
                          minLines: 1,
                          decoration: InputDecoration(
                              label: Text('Description'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter a Descrition'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {

                            if (_formKey.currentState!.validate()) {
                              print('task = $task');
                              if (task == 'Today Task') {
                                print('clicked today');
                                homeviewmodel.setTodayTask(TaskModel(
                                    title: titleController.text,
                                    desc: descController.text));
                                titleController.clear();
                                descController.clear();
                                Navigator.of(Get.overlayContext!,
                                        rootNavigator: true)
                                    .pop();
                              } else if (task == 'Tomorrow Task') {
                                print('clicked tomorrow');
                                homeviewmodel.setTomorrowTask(TaskModel(
                                    title: titleController.text,
                                    desc: descController.text));
                                titleController.clear();
                                descController.clear();
                                Navigator.of(Get.overlayContext!,
                                    rootNavigator: true)
                                    .pop();


                              } else {
                                print('clicked upcoming');
                                homeviewmodel.setUpcomingTask(TaskModel(
                                    title: titleController.text,
                                    desc: descController.text));
                                titleController.clear();
                                descController.clear();
                                Navigator.of(Get.overlayContext!,
                                    rootNavigator: true)
                                    .pop();
                              }
                            }
                          },
                          child: Card(
                            color: kgreen,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "ADD",
                                style: TextStyle(color: kwhite),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ));
              },
              child: Icon(
                Icons.add,
              )),
        ],
      ),
    );
  }

}
