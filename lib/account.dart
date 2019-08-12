import 'package:flutter/material.dart';

enum MembershipType {
  Basic,
  Regular,
  AllAccess,
  Private,
  Promotional,
  UniversityStudent,
  ChineseSchoolStudent,
  NonApplicable,
}

class Account {
  String firstName;
  String lastName;
  AssetImage profilePicture; //FIX: This should not be an AssetImage
  String emailAddress;
  Address billingAddress;
  Address shippingAddress;
  String phoneNumber;
  BasicContactInfo emergencyContactInfo;
  DateTime dateJoined;
  Membership membership;

  Account(
      {this.firstName,
      this.lastName,
      this.profilePicture,
      this.emailAddress,
      this.billingAddress,
      this.shippingAddress,
      this.phoneNumber,
      this.emergencyContactInfo,
      this.dateJoined,
      this.membership});
}

class Address {
  String address;
  String city;
  String state;
  String zipcode;

  Address({this.address, this.city, this.state, this.zipcode});
}

class Membership {
  MembershipType membershipType;
  DateTime startDate;
  DateTime endDate;
  SchoolAccount school;

  Membership({this.membershipType, this.startDate, this.endDate, this.school});

  String membershipTypeToString() {
    //TODO: Get rid of this when Dart support enums with custom values
    switch (this.membershipType) {
      case MembershipType.Basic:
        return "Basic";
        break;
      default:
        return "NonApplicable";
    }
  }
}

class BasicContactInfo {
  //TODO: Figure out how to deal with this
}

class SchoolAccount {
  String schoolName;
  List<Account> instructors; //Change this for security?
  Address location;

  SchoolAccount({this.schoolName, this.instructors, this.location});
}
