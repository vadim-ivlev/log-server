// Generated by CoffeeScript 1.6.3
/*
  Log parser class.

  Used to parse logs of Apache, Nginx and other servers
*/


(function() {
  this.LogParser = (function() {
    var getSeconds;

    function LogParser() {}

    getSeconds = function(timeString) {
      var a;
      a = timeString.split(":");
      return 3600 * a[0] + 60 * a[1] + 1 * a[2];
    };

    LogParser.parseLine = function(line) {
      var a, image, o, rand, responseCode, strRand;
      a = line.split(/\s+/);
      rand = Math.random();
      strRand = ("" + rand).substr(1, 4);
      responseCode = a[13];
      image = line.indexOf("fullimage") !== -1 || line.indexOf("filterimage") !== -1;
      return o = {
        line: line,
        time: a[2] + strRand,
        timeSec: getSeconds(a[2]) + rand,
        ip: a[5],
        method: a[10],
        request: a[11],
        response: responseCode,
        size: a[14],
        userAgent: a[16],
        success: responseCode === "200" || responseCode === "304",
        image: image
      };
    };

    return LogParser;

  })();

}).call(this);

/*
//@ sourceMappingURL=LogParser.map
*/
