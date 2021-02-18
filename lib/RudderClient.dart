import './RudderConfig.dart';
import './RudderTraits.dart';
import './RudderTraitsBuilder.dart';
import './RudderOption.dart';
import './RudderProperty.dart';
import 'package:flutter/services.dart';

class RudderClient {
  /* API for getting RudderClient instance with bare minimum
     *
     * @param context  Your Application context
     * @param writeKey Your Android WriteKey from RudderStack dashboard
     * @return RudderClient instance to be used further
     */
  static const platform = const MethodChannel('rudder_sdk_flutter');
  static void getInstance(String writeKey,
      {RudderConfigBuilder builder, RudderConfig config}) {
    if (config == null && builder == null) {
      config = RudderConfig();
    } else if (config == null && builder != null) {
      config = builder.build();
    }
    Map<String, dynamic> params = new Map();
    params['writeKey'] = writeKey;
    params['config'] = config.toMap();
    platform.invokeMethod("initializeSDK", params);
  }

  static void identify(String userId,
      {RudderTraits traits,
      RudderOption options,
      RudderTraitsBuilder builder}) {
    if (traits == null && builder != null) {
      traits = builder.build();
    }
    Map<String, dynamic> params = new Map();
    if (userId != null) {
      params["userId"] = userId;
    }
    if (traits != null) {
      params["traits"] = traits.traitsMap;
    }
    if (options != null) {
      params["option"] = options.externalIds;
    }
    platform.invokeMethod("identify", params);
  }

  static void track(String eventName,
      {RudderProperty properties, RudderOption options}) {
    Map<String, dynamic> params = new Map();
    if (eventName != null) {
      params["eventName"] = eventName;
    }
    if (properties != null) {
      params["properties"] = properties.getMap();
    }
    if (options != null) {
      params["options"] = options.externalIds;
    }
    print("making track call");
    print("params are" + params.toString());
    platform.invokeMethod("track", params);
  }
}
