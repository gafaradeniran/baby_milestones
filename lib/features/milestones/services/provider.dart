import 'dart:convert';
import 'package:baby_milestones/features/milestones/model/milestone_model.dart';
import 'package:baby_milestones/features/milestones/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MilestoneProvider extends ChangeNotifier {
  late List<Milestone> _milestones;
  final String _storageKey = 'milestones';
  final SharedPreferencesService _prefsService;

  MilestoneProvider(this._prefsService) {
    _milestones = [];
    _loadMilestones();
  }

  List<Milestone> get milestones => _milestones;

  Future<void> addMilestone(Milestone milestone) async {
    _milestones.add(milestone);
    await _saveMilestones();
    notifyListeners();
  }

  Future<void> updateMilestone(int index, Milestone updatedMilestone) async {
    if (index >= 0 && index < _milestones.length) {
      _milestones[index] = updatedMilestone;
      await _saveMilestones();
      notifyListeners();
    }
  }

  int getIndex(Milestone milestone) {
    return _milestones.indexOf(milestone);
  }

  Future<void> deleteMilestone(int index) async {
    _milestones.removeAt(index);
    await _saveMilestones();
    notifyListeners();
  }

  Future<void> _saveMilestones() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedMilestones = _milestones.map((m) => m.toJson()).toList();
    await prefs.setStringList(
        _storageKey, encodedMilestones.map((e) => e.toString()).toList());
  }

  Future<void> _loadMilestones() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encodedMilestones = prefs.getStringList(_storageKey);

      if (encodedMilestones != null) {
        _milestones = encodedMilestones
            .map((encodedMilestone) => Milestone.fromJson(
                  Map<String, dynamic>.from(
                    json.decode(encodedMilestone),
                  ),
                ))
            .toList();

        notifyListeners();
      }
    } catch (e) {
      throw ('Error decoding milestone: $e');
    }
  }
}
