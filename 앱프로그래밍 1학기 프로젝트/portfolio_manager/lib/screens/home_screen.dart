import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../services/portfolio_form_screen.dart';
import '../services/portfolio_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  String searchQuery = '';
  String selectedStack = '전체';
  List<QueryDocumentSnapshot> allDocs = [];
  StreamSubscription<QuerySnapshot>? _subscription;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _subscribeToFirestore();
  }

  void _subscribeToFirestore() {
    _subscription = FirebaseFirestore.instance.collection('portfolios').snapshots().listen((snapshot) {
      setState(() {
        allDocs = snapshot.docs;
      });
    });
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _subscription?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToAddOrEditPortfolio({Map<String, dynamic>? existing, String? docId}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PortfolioFormScreen(existingData: existing, docId: docId),
      ),
    );
  }

  void _deletePortfolio(String docId) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('삭제 확인'),
        content: const Text('정말 이 포트폴리오를 삭제하시겠습니까?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('portfolios').doc(docId).delete();
              Navigator.pop(context);
            },
            child: const Text('삭제', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final portfolios = allDocs.where((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final name = (data['name'] ?? '').toString().toLowerCase();
      final stack = (data['stack'] ?? '').toString();
      final query = searchQuery.toLowerCase();
      final stackMatch = selectedStack == '전체' || stack == selectedStack;
      return name.contains(query) && stackMatch;
    }).toList();

    final stackSet = {'전체', ...allDocs.map((d) => (d['stack'] ?? '').toString()).where((s) => s.isNotEmpty)};

    return Scaffold(
      appBar: AppBar(
        title: const Text('포트폴리오 목록'),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddOrEditPortfolio(),
        tooltip: '포트폴리오 등록',
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: '검색',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => searchQuery = '');
                      },
                    )
                        : null,
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedStack,
                  items: stackSet.map((stack) {
                    return DropdownMenuItem(value: stack, child: Text(stack));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) setState(() => selectedStack = value);
                  },
                ),
              ],
            ),
          ),
          if (portfolios.isEmpty)
            const Expanded(
              child: Center(
                child: Text('검색 조건에 맞는 포트폴리오가 없습니다.'),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: portfolios.length,
                itemBuilder: (context, index) {
                  final doc = portfolios[index];
                  final data = (doc as QueryDocumentSnapshot).data() as Map<String, dynamic>;
                  return PortfolioCard(
                    data: data,
                    onEdit: () => _navigateToAddOrEditPortfolio(existing: data, docId: doc.id),
                    onDelete: () => _deletePortfolio(doc.id),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
