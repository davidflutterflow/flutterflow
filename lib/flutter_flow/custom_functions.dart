import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String userIsEmpty(DocumentReference itemRef) {
  if (itemRef.toString().isNotEmpty) {
    return "Ref Exist";
  } else {
    return "Ref Not Exist";
  }
}

bool containsOrNot(
  String textFieldValue,
  String itemValue,
) {
  if (textFieldValue.isEmpty) {
    return false;
  }
  return itemValue.toLowerCase().contains(textFieldValue.toLowerCase());
}

int checkList(
  List<ItemsRecord> items,
  String textfieldValue,
) {
  if (textfieldValue.isEmpty) {
    return 0;
  }
  int containCount = 0;
  for (var item in items) {
    if (item.name.toLowerCase().contains(textfieldValue.toLowerCase())) {
      containCount++;
    }
  }
  return containCount;
}

List<ItemsRecord> searchResultList(
  String textFieldValue,
  List<ItemsRecord> items,
) {
  List<ItemsRecord> containItems;
  for (var item in items) {
    if (item.name.toLowerCase().contains(textFieldValue.toLowerCase())) {
      containItems.add(item);
    }
  }
  return containItems;
}

int calculateTotal(UsersRecord user) {
  //just add and sum as many field you have
  return (user.gradeOne + user.gradeTwo);
}
