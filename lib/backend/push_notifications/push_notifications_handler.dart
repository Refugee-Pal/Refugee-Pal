import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitPulse(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'home': (data) async => ParameterData(
        allParams: {
          'startingChip': getParameter<String>(data, 'startingChip'),
          'startingCategory': getParameter<String>(data, 'startingCategory'),
          'isNew': getParameter<bool>(data, 'isNew'),
        },
      ),
  'categoriesgallery': ParameterData.none(),
  'settings': ParameterData.none(),
  'map': (data) async => ParameterData(
        allParams: {
          'locationtoLoad': await getDocumentParameter<LocationsRecord>(
              data, 'locationtoLoad', LocationsRecord.fromSnapshot),
          'isLoadPrograms': getParameter<bool>(data, 'isLoadPrograms'),
        },
      ),
  'refugeepalwelcomescreen': ParameterData.none(),
  'connect': (data) async => ParameterData(
        allParams: {
          'chatToLoad': await getDocumentParameter<ChatsRecord>(
              data, 'chatToLoad', ChatsRecord.fromSnapshot),
          'professionToLoad': getParameter<String>(data, 'professionToLoad'),
        },
      ),
  'loginPage': ParameterData.none(),
  'category': (data) async => ParameterData(
        allParams: {
          'catrgorydetailed':
              getParameter<DocumentReference>(data, 'catrgorydetailed'),
        },
      ),
  'subcategory': (data) async => ParameterData(
        allParams: {
          'subcategorydetail':
              getParameter<DocumentReference>(data, 'subcategorydetail'),
        },
      ),
  'userjourney': ParameterData.none(),
  'settingsProfile': ParameterData.none(),
  'settingsAccInfo': ParameterData.none(),
  'settingsNotifs': ParameterData.none(),
  'settingsAccInfoCopy': ParameterData.none(),
  'userjourneyHelper': ParameterData.none(),
  'helperEdit': (data) async => ParameterData(
        allParams: {
          'rpToEdit': await getDocumentParameter<ResourceproviderRecord>(
              data, 'rpToEdit', ResourceproviderRecord.fromSnapshot),
          'subcategoryToEdit': await getDocumentParameter<SubcategoryRecord>(
              data, 'subcategoryToEdit', SubcategoryRecord.fromSnapshot),
          'indexInList': getParameter<int>(data, 'indexInList'),
          'isEditSubcategory': getParameter<bool>(data, 'isEditSubcategory'),
          'editOrganizationRP': getParameter<bool>(data, 'editOrganizationRP'),
        },
      ),
  'helperOrganization': (data) async => ParameterData(
        allParams: {
          'locationToEdit': await getDocumentParameter<LocationsRecord>(
              data, 'locationToEdit', LocationsRecord.fromSnapshot),
          'editing': getParameter<String>(data, 'editing'),
          'itemInList': getParameter<int>(data, 'itemInList'),
          'programToEdit': await getDocumentParameter<ProgramsRecord>(
              data, 'programToEdit', ProgramsRecord.fromSnapshot),
        },
      ),
  'helperChat': (data) async => ParameterData(
        allParams: {
          'chatToLoad': await getDocumentParameter<ChatsRecord>(
              data, 'chatToLoad', ChatsRecord.fromSnapshot),
        },
      ),
  'PhoneCode': (data) async => ParameterData(
        allParams: {
          'phoneNumber': getParameter<int>(data, 'phoneNumber'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
