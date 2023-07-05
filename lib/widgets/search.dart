import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20.0),
    color: Colors.green[200],
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start, 
    children: [
      const Expanded(
        child:  TextField(
          decoration: InputDecoration(
            hintText: 'Buscar...',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
        },
      ),
    ],
  ),
);

  }
}

// import 'package:flutter/material.dart';
// import 'package:wiki_vt/pages/login/login_page.dart';



// class BuscadorMyWorld extends StatefulWidget {
//   const BuscadorMyWorld({super.key});

//   @override
//   State<BuscadorMyWorld> createState() => _BuscadorMyWorldState();
// }

// class _BuscadorMyWorldState extends State<BuscadorMyWorld> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _isFocused = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.08,
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 21, 0),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buscador(context),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.046,
//               width: MediaQuery.of(context).size.width * 0.1,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.5),
//                   border: Border.all(
//                     color: Color.fromARGB(128, 114, 114, 114),
//                     width: 0.7,
//                   )),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.add,
//                   size: 20,
//                   color: Colors.black,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginPage()),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buscador(BuildContext context) {
//     return Expanded(
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             _isFocused = true;
//           });
//         },
//         child: Row(mainAxisSize: MainAxisSize.max, children: [
//           SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.046,
//             width: MediaQuery.of(context).size.width * 0.77,
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 labelText: "Buscar",
//                 labelStyle:
//                     const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
//                 floatingLabelStyle: const TextStyle(
//                     height: 1, color: Color.fromARGB(115, 69, 63, 67)),
//                 filled: true,
//                 fillColor:
//                     _isFocused ? Colors.grey[300] : const Color(0xFFF6F6F6),
//                 prefixIcon: const Icon(Icons.search),
//               ),
//               onTap: () {
//                 setState(() {
//                   _isFocused = true;
//                 });
//               },
//               onChanged: (value) {
//                 setState(() {
//                   // Sugerencias.filteredTripp = Sugerencias.tripps;
//                 });
//               },
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
