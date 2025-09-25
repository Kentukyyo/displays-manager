import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('presentation_displays');
  final messengerInstance = TestDefaultBinaryMessengerBinding.instance;
  final binaryMessenger = messengerInstance.defaultBinaryMessenger;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    binaryMessenger.setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    binaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect('42', '42');
  });
}
