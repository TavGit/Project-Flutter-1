import 'package:flutter/material.dart';
import 'dart:math';

class MyChat extends StatefulWidget {
  const MyChat({super.key});

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  final Random random = Random();
  final List<Map<String, String>> chatList = [];
  final List<String> names = [
    'Agus',
    'Ujang',
    'Ucup',
    'Sinta',
    'Sri',
    'Mery',
    'Wahyu',
    'Udin',
    'Asep',
    'Jaki',
    'Fahrul',
    'Putri',
    'Ica',
    'Angel',
    'Gustav',
  ];
  final List<String> messages = [
    'Hallo bro, apa kabar?',
    'Gw pengen pindah ke..............',
    'Gimana Puasa nya hari ini?',
    'Sahur tdi makan pake apa?',
    'Lagi apa?',
    'Sibuk gak?',
    'Besok jadi bukber kaga?',
    'OTW nih',
    'Eh gmn kabar SNBP?',
    'Rencana setelah lulus mau......',
    'Wkwkwkwk, kocak lu',
    'Lu mau kuliah dimana?',
    'Enakkan kerja apa kuliah si?',
    'Eh gw dapet info loker nih........',
    'Woy ayo login!!',
  ];
  String getRandomTime() {
    int waktu = random.nextInt(24) + 1;
    return '$waktu jam yang lalu';
  }

  void generateUnikChat(int count) {
    Set<String> pakeNama = {};
    Set<String> pakePesan = {};
    Set<String> pakeFoto = {};

    while (chatList.length < count) {
      String nama = names[random.nextInt(names.length)];
      String pesan = messages[random.nextInt(messages.length)];
      String foto;

      do {
        foto = 'https://picsum.photos/seed/${random.nextInt(100)}/200/300';
      } while (pakeFoto.contains(foto));

      if (!pakeNama.contains(nama) && !pakePesan.contains(pesan)) {
        pakeNama.add(nama);
        pakePesan.add(pesan);
        pakeFoto.add(foto);

        chatList.add({
          'nama': nama,
          'pesan': pesan,
          'waktu': getRandomTime(),
          'foto': foto,
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    generateUnikChat(15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.camera_alt_outlined),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        title: Text(
          'ChatsApp',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 380,
              child: TextField(
                autofocus: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Tanya Meta AI atau Cari',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 1,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(chatList[index]['foto']!),
                    ),
                    title: Text(
                      chatList[index]['nama']!,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(chatList[index]['pesan']!),
                    trailing: Text(chatList[index]['waktu']!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Chat1(
                                nama: chatList[index]['nama']!,
                                pesan: chatList[index]['pesan']!,
                                foto: chatList[index]['foto']!,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chat1 extends StatelessWidget {
  const Chat1({
    super.key,
    required this.nama,
    required this.pesan,
    required this.foto,
  });

  final String nama;
  final String pesan;
  final String foto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(foto)),
            SizedBox(width: 10),
            Text(nama, style: TextStyle(fontSize: 20, color: Colors.white)),],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 40,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.videocam_outlined, color: Colors.white,),iconSize: 27,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 40,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.phone_outlined, color: Colors.white,), iconSize: 27,),
            )
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.white,), iconSize: 27,),
            )
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: ListTile(
                tileColor: Colors.white,
                subtitle: Text(pesan, style: TextStyle(fontSize: 20)),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 270)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.10),
              child: TextField(
                autocorrect: false,
                autofocus: true,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.green[500],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green[500]!, width: 10),
                  ),
                  hintText: 'Ketik Pesan',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.emoji_emotions),
                  prefixIconColor: Colors.white,
                  suffixIcon: IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.send, size: 30),
                  ),
                  suffixIconColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green[500]!, width: 4.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green[500]!, width: 4.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
