//
// import 'package:flutter/material.dart';
//
// class EditTaskScreen extends StatefulWidget {
//   static const routeName = '/edit-task';
//
//   @override
//   _EditTaskScreenState createState() => _EditTaskScreenState();
// }
//
// class _EditTaskScreenState extends State<EditTaskScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // Load existing task details if needed
//   }
//
//   void _saveChanges() {
//     if (_formKey.currentState?.validate() ?? false) {
//       final title = _titleController.text;
//       final description = _descriptionController.text;
//       final time = _timeController.text;
//
//       // هنا يمكنك حفظ التعديلات في قاعدة البيانات أو أي مكان آخر
//       // على سبيل المثال: await _database.updateTask(task);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Changes saved successfully!')),
//       );
//
//       Navigator.pop(context); // العودة إلى الشاشة السابقة بعد الحفظ
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE8F5E9), // اللون الأخضر الفاتح كخلفية
//       appBar: AppBar(
//         title: Text('To Do List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         backgroundColor: Color(0xFF64B5F6), // اللون الأزرق
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Center(
//         child: Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min, // تقليل حجم العمود على المحتوى فقط
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Edit Task',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 16),
//                   TextFormField(
//                     controller: _titleController,
//                     decoration: InputDecoration(labelText: 'This is title'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a title';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: _descriptionController,
//                     decoration: InputDecoration(labelText: 'Task details'),
//                   ),
//                   TextFormField(
//                     controller: _timeController,
//                     decoration: InputDecoration(labelText: 'Select time'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a time';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     '27-6-2021',
//                     style: TextStyle(color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 16),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: _saveChanges,
//                       style: ElevatedButton.styleFrom(
//                         primary: Color(0xFF64B5F6), // لون الزر الأزرق
//                         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                       child: Text('Save Changes', style: TextStyle(fontSize: 16)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  static const routeName = '/edit-task';

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  // المتغيرات اللي تمثل البيانات القديمة اللي هتعدل عليها
  String oldTitle = 'Default Title';
  String oldDescription = 'Default Description';
  String oldTime = '12:00 PM';

  @override
  void initState() {
    super.initState();
    // تحميل البيانات القديمة في الحقول
    _titleController.text = oldTitle;
    _descriptionController.text = oldDescription;
    _timeController.text = oldTime;
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      // الحصول على القيم الجديدة
      final newTitle = _titleController.text;
      final newDescription = _descriptionController.text;
      final newTime = _timeController.text;

      // هنا بتحديث القيم القديمة بالجديدة
      setState(() {
        oldTitle = newTitle;
        oldDescription = newDescription;
        oldTime = newTime;
      });

      // هنا ممكن تحفظ في قاعدة بيانات أو أي مكان تخزين تاني
      // مثال:
      // await database.updateTask(taskId, newTitle, newDescription, newTime);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Changes saved successfully!')),
      );

      Navigator.pop(context); // الرجوع للشاشة السابقة بعد الحفظ
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F5E9), // اللون الأخضر الفاتح كخلفية
      appBar: AppBar(
        title: Text('To Do List',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF64B5F6), // اللون الأزرق
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // تقليل حجم العمود على المحتوى فقط
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Task',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'This is title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Task details'),
                  ),
                  TextFormField(
                    controller: _timeController,
                    decoration: InputDecoration(labelText: 'Select time'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a time';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    '27-6-2021',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF64B5F6), // لون الزر الأزرق
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child:
                          Text('Save Changes', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
