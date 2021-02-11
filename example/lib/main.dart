import 'package:flutter/material.dart';
import 'package:rudder_sdk_flutter/RudderClient.dart';
import 'package:rudder_sdk_flutter/RudderConfig.dart';
import 'package:rudder_sdk_flutter/RudderLogger.dart';
import 'package:rudder_sdk_flutter/RudderTraits.dart';
import 'package:rudder_sdk_flutter/RudderTraitsBuilder.dart';
import 'package:rudder_sdk_flutter/RudderProperty.dart';
import 'package:rudder_sdk_flutter/RudderOption.dart';

class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  void __identify() {
    // Address address = new Address("Kolkata");
    RudderTraits traits = RudderTraits()
        .putName("Manashi Mazumder")
        .putAge("24")
        .putEmail("manashi@gmail.com")
        //.putAddress(address)
        .putPhone("9090909090");
    traits.put("city", "Kolkata");
    RudderClient.identify("User_111", traits: traits);
    print("1st identify call");
  }

  void __identify1() {
    final DateTime now = DateTime.now();
    RudderOption option = RudderOption();
    option.putExternalId("testing", "1");
    option.putExternalId("deploying", "2");
    Address address =
        Address("Kaasol", "India", "70808", "Himachal Pradesh", "39/0A");

    RudderTraits traits = RudderTraits()
        .putBirthdayDate(now)
        .putName("Sajal Mohanta")
        .putFirstName("Sajal")
        .putLastName("Mohanta")
        .putGender("Male")
        .putEmail("sajal@gmail.com")
        .putAddress(address)
        .putPhone("5555555555555");

    //RudderClient.identify("User_222", traits: traits);
    RudderClient.identify("User_222", traits: traits, options: option);
    //RudderClient.identify("User_111", traits: traits);
    print("2nd identify call");
  }

  void __identify2() {
    RudderTraitsBuilder builder = new RudderTraitsBuilder();
    builder
        .setName("sirisha")
        .setEmail("siri@gmail.com")
        .setBirthDay("2020-09-01")
        .setCompanyName("Rudderstack")
        .setCity("Durgapur");
    RudderClient.identifyWithTraitsBuilder("User_333", builder: builder);
    print("3rd identify call");
  }

  void __track() {
    //for (var i = 1; i < 10100; i++) {
    RudderClient.track("track call : ");
    //print("track call : " + i.toString());
    //}
    // RudderClient.track("Sample Track Call before identify");
    print("1st track call");
  }

  void __track1() {
    RudderProperty property = new RudderProperty();
    property.put("productId", "p0090809978");
    property.put("price", 2230);
    property.put("currency", "INR");
    property.put("size", "S");
    RudderClient.track("Product Viewed", properties: property);
    print("2nd track call");
  }

  void __track2() {
    var childProperty = {
      'productId': 'p0090809978',
      'price': 2230,
      'quantity': 2
    };
    RudderProperty property = new RudderProperty();
    property.put("orderId", "p0090809978");
    property.put("revenue", 3000);
    property.put("quantity", 5);
    property.put("products", childProperty);
    RudderClient.track("order completed", properties: property);
    print("3rd track call");
  }

  void __track3() {
    var list = new List();
    var childProperty = {
      'productId': 'p0090809978',
      'price': 2230,
      'quantity': 2
    };
    var detailspro = {'details': 'bla bla bla'};

    list.add(childProperty);
    RudderProperty property = new RudderProperty();
    property.put("orderId", "p0090809978");
    property.put("revenue", 3000);
    property.put("quantity", 5);
    property.put("products", list);
    property.put("details", detailspro);
    RudderClient.track("Product Wishlisted", properties: property);
    print("4th track call");
  }

  void __track4() {
    RudderClient.track("new call by new id");
    print("5th track call");
  }

  void __screen() {
    RudderClient.screen("ViewController");
    print("1st screen call");
  }

  void __screen1() {
    var detailspro = {'details': 'bla bla bla'};
    RudderProperty property = new RudderProperty();
    property.put("name", "home page name");
    property.put("category", "home page category");
    property.put("details", detailspro);
    RudderClient.screen("Flipkart home page", properties: property);
    print("2nd screen call");
  }

  void __group() {
    RudderTraits groupTraits = RudderTraits();
    groupTraits.put("name", "Info Matrics");
    groupTraits.put("no_of_person", 103);
    groupTraits.put("email", "ruchira@gmail.com");
    RudderClient.group("group_111", groupTraits: groupTraits);
    print("1st group call");
  }

  void __group1() {
    RudderTraits groupTraits = RudderTraits();
    groupTraits.put("groupId", "group2222");
    groupTraits.put("email", "desu@gmail.com");
    RudderClient.group("sample_group_id", groupTraits: groupTraits);
    print("2nd group call");
  }

  void __reset() {
    RudderClient.reset();
    print("1st reset call");
  }

  void __alias() {
    RudderClient.alias("New_Manashi_111");
    print("1st alias call");
  }

  void __alias1() {
    RudderClient.alias("New_User_333");
    print("2nd alias call");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Initialize SDK'),
              onPressed: () {
                RudderConfigBuilder builder = RudderConfigBuilder();
                builder.withDataPlaneUrl("https://6767347d5455.ngrok.io");
                builder.withLogLevel(RudderLogger.VERBOSE);
                builder.withRecordScreenViews(true);
                // 1. with RudderConfig Object
                //RudderClient.getInstance("1n0JdVPZTRUIkLXYccrWzZwdGSx",
                //   config: builder.build());

                //2. With RudderConfigBuilder object
                RudderClient.getInstanceWithConfigBuilder(
                    "1f30MHV7UkLhfQBxBdKoebxaDXj",
                    builder: builder);
              },
            ),
            ElevatedButton(
              child: Text('Identify 0'),
              onPressed: __identify,
            ),
            ElevatedButton(
              child: Text('Identify 1'),
              onPressed: __identify1,
            ),
            ElevatedButton(
              child: Text('Identify 2'),
              onPressed: __identify2,
            ),
            ElevatedButton(
              child: Text('Track 0'),
              onPressed: __track,
            ),
            ElevatedButton(
              child: Text('Track 1'),
              onPressed: __track1,
            ),
            ElevatedButton(
              child: Text('Track 2'),
              onPressed: __track2,
            ),
            ElevatedButton(
              child: Text('Track 3'),
              onPressed: __track3,
            ),
            ElevatedButton(
              child: Text('Track 4'),
              onPressed: __track4,
            ),
            ElevatedButton(
              child: Text('Screen 0'),
              onPressed: __screen,
            ),
            ElevatedButton(
              child: Text('Screen 1'),
              onPressed: __screen1,
            ),
            ElevatedButton(
              child: Text('Group'),
              onPressed: __group,
            ),
            ElevatedButton(
              child: Text('Group 1'),
              onPressed: __group1,
            ),
            ElevatedButton(
              child: Text('Reset 0'),
              onPressed: __reset,
            ),
            ElevatedButton(
              child: Text('Alias 0'),
              onPressed: __alias,
            ),
            ElevatedButton(
              child: Text('Alias 1'),
              onPressed: __alias1,
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: PlatformChannel()));
}
