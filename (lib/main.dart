import 'package:flutter/material.dart';

void main() {
  runApp(const CallerXApp());
}

class CallerXApp extends StatelessWidget {
  const CallerXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caller X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121B22),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F2C34),
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00A884),
          surface: Color(0xFF1F2C34),
        ),
      ),
      home: const MainWhatsAppScreen(),
    );
  }
}

class MainWhatsAppScreen extends StatefulWidget {
  const MainWhatsAppScreen({super.key});

  @override
  State<MainWhatsAppScreen> createState() => _MainWhatsAppScreenState();
}

class _MainWhatsAppScreenState extends State<MainWhatsAppScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Caller X',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8696A0),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Color(0xFF8696A0)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search, color: Color(0xFF8696A0)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Color(0xFF8696A0)), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF00A884),
          indicatorWeight: 3.5,
          labelColor: const Color(0xFF00A884),
          unselectedLabelColor: const Color(0xFF8696A0),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          tabs: const [
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // চ্যাট লিস্ট ভিউ
          ListView(
            children: [
              _buildChatTile("Team Caller X", "Welcome to native Caller X!", "12:00 PM", 1),
              _buildChatTile("Demo Contact", "Voice call and screen share ready", "Yesterday", 0),
            ],
          ),
          // স্ট্যাটাস ভিউ
          ListView(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF00A884),
                  child: Icon(Icons.add, color: Colors.white),
                ),
                title: Text("My Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text("Tap to add status update", style: TextStyle(color: Color(0xFF8696A0))),
              ),
            ],
          ),
          // কল হিস্ট্রি ভিউ
          ListView(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF1F2C34),
                  child: Icon(Icons.call_received, color: Color(0xFF00A884)),
                ),
                title: Text("Incoming Video Call", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text("Today, 5:45 PM", style: TextStyle(color: Color(0xFF8696A0))),
                trailing: Icon(Icons.videocam, color: Color(0xFF00A884)),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        onPressed: () {},
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }

  Widget _buildChatTile(String title, String subtitle, String time, int unreadCount) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: const Color(0xFF6B7B85),
        child: const Icon(Icons.person, color: Colors.white, size: 30),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFF8696A0))),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: TextStyle(color: unreadCount > 0 ? const Color(0xFF00A884) : const Color(0xFF8696A0), fontSize: 12)),
          if (unreadCount > 0) ...[
            const SizedBox(height: 4),
            CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFF00A884),
              child: Text('$unreadCount', style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ],
      ),
    );
  }
}
