import 'package:flutter/material.dart';
import '../services/plan_storage_service.dart';

class GoalPlanChecklist extends StatefulWidget {
  final String title;
  final List<String> planItems;

  const GoalPlanChecklist({
    super.key,
    required this.title,
    required this.planItems,
  });

  @override
  State<GoalPlanChecklist> createState() => _GoalPlanChecklistState();
}

class _GoalPlanChecklistState extends State<GoalPlanChecklist> {
  List<bool> _completed = [];

  @override
  void initState() {
    super.initState();
    _loadChecklist();
  }

  Future<void> _loadChecklist() async {
    final loaded = await PlanStorageService.loadChecklist(widget.title, widget.planItems.length);
    setState(() {
      _completed = loaded;
    });
  }

  Future<void> _updateChecklist(int index, bool? value) async {
    setState(() {
      _completed[index] = value ?? false;
    });
    await PlanStorageService.saveChecklist(widget.title, _completed);
  }

  @override
  Widget build(BuildContext context) {
    if (_completed.length != widget.planItems.length) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Sıfırla",
            onPressed: () async {
              final resetList = List<bool>.filled(widget.planItems.length, false);
              await PlanStorageService.saveChecklist(widget.title, resetList);
              setState(() {
                _completed = resetList;
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.planItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.only(bottom: 12),
            child: CheckboxListTile(
              value: _completed[index],
              onChanged: (val) => _updateChecklist(index, val),
              title: Text(
                widget.planItems[index],
                style: TextStyle(
                  color: _completed[index] ? Colors.greenAccent : Colors.white,
                  decoration: _completed[index] ? TextDecoration.lineThrough : null,
                ),
              ),
              activeColor: Colors.greenAccent,
              checkColor: Colors.black,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        },
      ),
    );
  }
}
