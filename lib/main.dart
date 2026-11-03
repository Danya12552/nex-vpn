import 'package:flutter/material.dart';

void main() {
  runApp(const NexVPN());
}

class NexVPN extends StatelessWidget {
  const NexVPN({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool connected = false;
  String country = 'Germany';

  final servers = [
    ['🇩🇪', 'Germany', '35 ms'],
    ['🇳🇱', 'Netherlands', '42 ms'],
    ['🇫🇮', 'Finland', '28 ms'],
    ['🇸🇪', 'Sweden', '31 ms'],
    ['🇺🇸', 'United States', '120 ms'],
    ['🇫🇷', 'France', '39 ms'],
    ['🇯🇵', 'Japan', '160 ms'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080D18),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'NEX VPN',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  const Icon(
                    Icons.bolt,
                    color: Color(0xFF3185FF),
                    size: 32,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            Text(
              connected ? 'CONNECTED' : 'PROTECTED BY NEX',
              style: const TextStyle(
                color: Colors.white70,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 35),

            GestureDetector(
              onTap: () {
                setState(() {
                  connected = !connected;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF111D31),
                  border: Border.all(
                    color: connected
                        ? Colors.greenAccent
                        : const Color(0xFF3185FF),
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: connected
                          ? Colors.green.withOpacity(0.4)
                          : Colors.blue.withOpacity(0.4),
                      blurRadius: 45,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  connected
                      ? Icons.check
                      : Icons.bolt,
                  size: 95,
                  color: connected
                      ? Colors.greenAccent
                      : Colors.blueAccent,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              connected ? 'Demo mode' : 'Tap to connect',
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 45),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SELECT LOCATION',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                itemCount: servers.length,
                itemBuilder: (context, index) {
                  final server = servers[index];
                  final selected = country == server[1];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        country = server[1];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: const Color(0xFF151E2D),
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: selected
                              ? Colors.blueAccent
                              : Colors.transparent,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            server[0],
                            style: const TextStyle(fontSize: 25),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              server[1],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            server[2],
                            style: const TextStyle(
                              color: Colors.greenAccent,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            selected
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'NEX VPN • PREMIUM SECURITY',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}