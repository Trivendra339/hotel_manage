import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataProvider extends  GetxController{
  List<String> _items = [
    "GROUND FLOOR",
    "FIRST FLOOR",
    "SECOND FLOOR",
    "THIRD FLOOR",
    "FOURTH FLOOR",
    "GROUND FLOOR",
    "FIRST FLOOR",
    "SECOND FLOOR",
    "THIRD FLOOR",
    "FOURTH FLOOR",].obs;
  bool _isLoading = false;

  List<String> get items => _items;
  bool get isLoading => _isLoading;

  Future<void> fetchItems() async {
    _isLoading = true;

    // final response = await http.get(Uri.parse('https://api.example.com/items'));
    //
    // if (response.statusCode == 200) {
    //   List<dynamic> data = json.decode(response.body);
    //   _items = List<String>.from(data); // Assuming API returns a list of strings
    // } else {
    //   throw Exception('Failed to load items');
    // }
    //
    // _isLoading = false;
    // notifyListeners();
  }
}




// 1. Provider Setup Karna :-

// class BoardTypeProvider with ChangeNotifier {
//   List<BoardType> _boardTypes = [];
//   BoardType? _selectedBoardType;
//
//   List<BoardType> get boardTypes => _boardTypes;
//   BoardType? get selectedBoardType => _selectedBoardType;
//
//   Future<void> fetchBoardTypes() async {
//     final response = await http.get(Uri.parse('https://api.example.com/board-types'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       _boardTypes = data.map((item) => BoardType.fromJson(item)).toList();
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   void selectBoardType(BoardType newType) {
//     _selectedBoardType = newType;
//     notifyListeners();
//   }
// }


// 2. Provider Ko HomeScreen Mein Implement Karna :-

// import 'package:provider/provider.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => BoardTypeProvider()..fetchBoardTypes(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Home Screen'),
//           actions: [
//             BoardTypeMenu(),
//           ],
//         ),
//         body: Center(
//           child: Consumer<BoardTypeProvider>(
//             builder: (context, provider, child) {
//               return Text(
//                 'Selected View: ${provider.selectedBoardType == null ? 'None' : provider.selectedBoardType!.name}',
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


// 3. PopupMenuButton Ko Provider Ke Saath Link Karna :-

// class BoardTypeMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final boardTypeProvider = Provider.of<BoardTypeProvider>(context);
//
//     return PopupMenuButton<BoardType>(
//       onSelected: (BoardType selectedType) {
//         boardTypeProvider.selectBoardType(selectedType);
//       },
//       itemBuilder: (context) {
//         if (boardTypeProvider.boardTypes.isEmpty) {
//           return [
//             PopupMenuItem(
//               child: Text('Loading...'),
//               enabled: false,
//             )
//           ];
//         }
//         return boardTypeProvider.boardTypes.map((type) {
//           return PopupMenuItem<BoardType>(
//             value: type,
//             child: Text(type.name),
//           );
//         }).toList();
//       },
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             "My Hotel",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(width: 4),
//           Icon(Icons.arrow_drop_down),
//         ],
//       ),
//     );
//   }
// }
