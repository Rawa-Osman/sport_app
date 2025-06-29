class ApiConstants {
  static const String apiVersion = 'v1';
  static const String baseUrl = 'https://staging.torliga.com/api/$apiVersion';   // i don't rewrite baseUrl, i just use it one time in dio config file

  // matches
  static const String todayMatches = '/home/todayMatches';
  static const String yesterdayMatches = '/home/yesterdayMatches';
  static const String tomorrowMatches = '/home/tomorrowMatches';
  
  // token
  static const String authToken = '15819|rX7ELUR9o4zNtSfCvAygVYvhTeiPGGBn18gNXotU3d8b99d2';
  
  // websoket
  static const String websocketUrl = 'wss://mqtt.staging.torliga.com/app/4bae652d93c285868d11?protocol=7&client=js&version=4.3.1&flash=false';
  static const String websocketChannel = 'thesports-football.matchs';
  static const String scoreEvent = 'score-event';
}