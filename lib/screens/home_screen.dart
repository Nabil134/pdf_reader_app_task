
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf_reader_app/screens/reader_screen.dart';

import '../models/document_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),
        ),
        title: Text('PDF Reader'),
      ),

body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
  child: SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Recent Documents',style:GoogleFonts.roboto(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
      ),),
      Column(children: Document.doc_list.map((doc) => ListTile(
        onTap: (){
          Navigator.push(
              context,
            MaterialPageRoute(builder: (context)=>ReaderScreen(doc)));
        },
        title:Text(doc.doc_title!,style: GoogleFonts.nunito(),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('${doc.page_num!} Pages'),
        trailing: Text(doc.doc_date!,style: GoogleFonts.nunito(
          color: Colors.grey,
        ),),
        leading: Icon(Icons.picture_as_pdf,
          color: Colors.red,
          size: 32.0,
        ),
      )).toList(),
      ),
    ],
  ),
),),
    );
  }
}
