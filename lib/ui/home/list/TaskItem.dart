// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:todo/AppDateUtils.dart';
// import 'package:todo/database/models/Task.dart';
// import 'package:todo/ui/DialogUtils.dart';
// import 'package:todo/ui/utils.dart';
//
// import '../../../edit_task_screen.dart';
//
// typedef OnTaskDeleteClick = void Function(Task task);
// class TaskItem extends StatelessWidget {
//
//   Task task;
//   OnTaskDeleteClick onDeleteClick;
//   TaskItem({required this.task,required this.onDeleteClick});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 12),
//       child: Slidable(
//         startActionPane: ActionPane(
//           motion: DrawerMotion(),
//           children: [
//             SlidableAction(onPressed: (buildContext){
//               // delete
//               showMessageDialog(context, message:
//               "Are you sure to delete this task ?",
//                   posButtonTitle: "confirm",posButtonAction:(){
//                     // delete Task
//                     onDeleteClick(task);
//                   },
//                   negButtonTitle: "cancel"
//               );
//             },
//               icon: Icons.delete,
//               backgroundColor: Colors.red,
//               label: 'delete',
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 bottomLeft: Radius.circular(12),
//               ),
//             ),
//     SlidableAction(
//     onPressed: (context) {
//     Navigator.pushNamed (context, EditTaskScreen.routeNAme,
//     arguments: model,
//     );
//
//     },
//     label: "Edit",
//     backgroundColor: Colors.blue,
//     icon: Icons.edit,
//     ),
// // SlidableAction
//     ]
//     ), // ActionPane
//     child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//     children: [
//     Container(
//     height: 90,
//     width: 2,
//     color: model.isDone? Colors.green: Colors.blue),
//     SizedBox(
//     width: 18,
//     ),
// // SizedBox
//     Expanded(
//     child: Column (
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     model.title,
//     style: TextStyle(
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//     color: model.isDone? Colors.green: Colors.blue
//     ),
// // Text
//     Text(
//     model.description,
//     style: TextStyle(fontSize: 16),
//     ),
//     ],
//     ),
//     ),
//     model.isDone
//     ? Text(
//     "DONE!!"
//     style: TextStyle (fontSize: 22 color: Colors.green),
//     )
//               : IconButton(
//           onPressed: () {
//     model.isDone = true;
//     FirebaseFunctions.updateTask(model);
//     },
//         padding: EdgeInsets.zero,
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             minimumSize: Size (80, 40),
//             shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12))),
//     icon: Icon (
//     Icons.done,
//     size: 30,
//     color: Colors.white,
//     )) // Icon, IconButton
//     ],
//         ),
//         child: Card(
//
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12)
//           ),
//           color: Colors.white,
//           child: Container(
//             padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 24
//             ),
//             child: Row(
//               children: [
//                 Container(width: 4,height: 64,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Theme.of(context).primaryColor,)
//                 ),
//                 SizedBox(width: 12,),
//                 Expanded(
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children:[
//                           Text('${task.title}',
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                           SizedBox(height: 8,),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Icon(Icons.watch_later_outlined),
//                               SizedBox(width: 8,),
//
//                               Text('${task.time?.formatTime()}',
//                                 style: Theme.of(context).textTheme.bodySmall,
//                               )
//
//                             ],)
//                         ]
//                     )),
//                 SizedBox(width: 12,),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 24,
//                       vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child:ImageIcon(
//                     AssetImage(getImagePath('ic_check.png'),),
//                     color: Colors.white,
//                   ),)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
//
// import '../../../edit_task_screen.dart';
//
// typedef OnTaskDeleteClick = void Function();
//
// class TaskItem extends StatelessWidget {
//   final String title;
//   final String description;
//   final String time;
//   final bool isDone;
//   final OnTaskDeleteClick onDeleteClick;
//
//   TaskItem({
//     required this.title,
//     required this.description,
//     required this.time,
//     required this.isDone,
//     required this.onDeleteClick,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12),
//       child: Slidable(
//         startActionPane: ActionPane(
//           motion: const DrawerMotion(),
//           children: [
//             SlidableAction(
//               onPressed: (context) {
//                 onDeleteClick();
//               },
//               icon: Icons.delete,
//               backgroundColor: Colors.red,
//               label: 'Delete',
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 bottomLeft: Radius.circular(12),
//               ),
//             ),
//             SlidableAction(
//               onPressed: (context) {
//                 Navigator.pushNamed(context, EditTaskScreen.routeName);
//               },
//               label: "Edit",
//               backgroundColor: Colors.blue,
//               icon: Icons.edit,
//             ),
//           ],
//         ),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//             child: Row(
//               children: [
//                 Container(
//                   width: 4,
//                   height: 64,
//                   decoration: BoxDecoration(
//                     color: isDone ? Colors.green : Colors.blue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Icon(Icons.watch_later_outlined),
//                           const SizedBox(width: 8),
//                           Text(
//                             time,
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 isDone
//                     ? const Text(
//                   "DONE",
//                   style: TextStyle(fontSize: 22, color: Colors.green),
//                 )
//                     : IconButton(
//                   onPressed: () {
//                     // منطق تحديث الحالة
//                   },
//                   icon: const Icon(
//                     Icons.done,
//                     size: 30,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
//
// typedef OnTaskDeleteClick = void Function();
// typedef OnTaskEditClick = void Function(); // Added type for onEditClick
//
// class TaskItem extends StatelessWidget {
//   final String title;
//   final String description;
//   final String time;
//   final bool isDone;
//   final OnTaskDeleteClick onDeleteClick;
//   final OnTaskEditClick onEditClick; // Added onEditClick
//
//   const TaskItem({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.time,
//     required this.isDone,
//     required this.onDeleteClick,
//     required this.onEditClick, // Added in constructor
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12),
//       child: Slidable(
//         startActionPane: ActionPane(
//           motion: const DrawerMotion(),
//           children: [
//             SlidableAction(
//               onPressed: (context) {
//                 onDeleteClick();
//               },
//               icon: Icons.delete,
//               backgroundColor: Colors.red,
//               label: 'Delete',
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 bottomLeft: Radius.circular(12),
//               ),
//             ),
//             SlidableAction(
//               onPressed: (context) {
//                 onEditClick(); // Use the onEditClick callback
//               },
//               label: "Edit",
//               backgroundColor: Colors.blue,
//               icon: Icons.edit,
//             ),
//           ],
//         ),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//             child: Row(
//               children: [
//                 Container(
//                   width: 4,
//                   height: 64,
//                   decoration: BoxDecoration(
//                     color: isDone ? Colors.green : Colors.blue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Icon(Icons.watch_later_outlined),
//                           const SizedBox(width: 8),
//                           Text(
//                             time,
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 isDone
//                     ? const Text(
//                   "DONE",
//                   style: TextStyle(fontSize: 22, color: Colors.green),
//                 )
//                     : IconButton(
//                   onPressed: () {
//                     // Placeholder for updating the status
//                   },
//                   icon: const Icon(
//                     Icons.done,
//                     size: 30,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

typedef OnTaskDeleteClick = void Function();
typedef OnTaskEditClick = void Function();

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final bool isDone;
  final OnTaskDeleteClick onDeleteClick;
  final OnTaskEditClick onEditClick;

  const TaskItem({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
    required this.isDone,
    required this.onDeleteClick,
    required this.onEditClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                onDeleteClick();
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: 'Delete',
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            SlidableAction(
              onPressed: (context) {
                onEditClick();
              },
              label: "Edit",
              backgroundColor: Colors.blue,
              icon: Icons.edit,
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 64,
                  decoration: BoxDecoration(
                    color: isDone ? Colors.green : Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.watch_later_outlined),
                          const SizedBox(width: 8),
                          Text(
                            time,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isDone
                    ? const Text(
                        "DONE",
                        style: TextStyle(fontSize: 22, color: Colors.green),
                      )
                    : IconButton(
                        onPressed: () {
                          // Placeholder for updating the status
                        },
                        icon: const Icon(
                          Icons.done,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
