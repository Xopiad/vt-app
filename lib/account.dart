import 'package:flutter/material.dart';

class Account {
  String first_name;
  String last_name;
  Image profile_picture;
  String email_address;
  Address billing_address;
  Address shipping_address;
  String phone_number;

  Account(
      {this.first_name,
      this.last_name,
      this.profile_picture,
      this.email_address,
      this.billing_address,
      this.shipping_address,
      this.phone_number});
}

class Address {
  String address;
  String city;
  String zipcode;
}
