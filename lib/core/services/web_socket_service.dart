import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:sport_app/core/constants/api_constants.dart';

class WebSocketService {
  late WebSocketChannel _channel;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse(ApiConstants.websocketUrl),
    );
  }

  void subscribe(String channelName) {
    _channel.sink.add(
      '{"event": "pusher:subscribe", "data": {"channel": "$channelName"}}',
    );
  }

  Stream<dynamic> get stream => _channel.stream;

  void disconnect() {
    _channel.sink.close();
  }
}