// Generated by CoffeeScript 1.6.3
/*
  Class Log
  Represents a tail of the server log
*/


(function() {
  this.Log = (function() {
    var get_long_line, get_short_line, splitTailText, tailToArray;

    function Log() {}

    tailToArray = function(tailText) {
      var line, _i, _len, _ref, _results;
      _ref = splitTailText(tailText);
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        line = _ref[_i];
        _results.push(LogParser.parseLine(line));
      }
      return _results;
    };

    splitTailText = function(text) {
      var a;
      a = text.split("\n");
      a.pop();
      return a.slice(1);
    };

    get_short_line = function(o, j) {
      var text;
      text = "" + (GLOB.toStr(j, 4)) + "  " + o.time + "   " + (o.timeSec.toFixed(3)) + "   " + (GLOB.toStr(o.method, 5)) + " " + (GLOB.toStr(o.response, 5)) + " " + (GLOB.toStr(o.size, 10));
      if (o.method === "not") {
        text += "" + o.request + "<br/>";
        text += "" + o.line + "<br/>";
      }
      return text;
    };

    get_long_line = function(o, j) {
      var text;
      return text = "" + j + " " + o.line;
    };

    Log.prototype.getCurrentTime = function() {
      var d;
      d = new Date();
      return "" + (d.getHours()) + ":" + (d.getMinutes()) + ":" + (d.getSeconds()) + "." + (d.getMilliseconds());
    };

    Log.prototype.getCurrentSec = function() {
      var d;
      d = new Date();
      return 3600 * d.getHours() + 60 * d.getMinutes() + d.getSeconds() + 0.001 * d.getMilliseconds();
    };

    Log.prototype.getPastRecords = function(backSec, spanSec) {
      var i, now, o, _i, _len, _ref, _results;
      now = this.getCurrentSec();
      _ref = this.LOG;
      _results = [];
      for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
        o = _ref[i];
        if (now - o.timeSec > backSec && now - o.timeSec < (backSec + spanSec)) {
          _results.push(get_short_line(o, i));
        }
      }
      return _results;
    };

    Log.prototype.addText = function(text) {
      return this.LOG = tailToArray(text);
    };

    Log.prototype.getShortLog = function() {
      var j, o;
      return ((function() {
        var _i, _len, _ref, _results;
        _ref = this.LOG;
        _results = [];
        for (j = _i = 0, _len = _ref.length; _i < _len; j = ++_i) {
          o = _ref[j];
          _results.push(get_short_line(o, j));
        }
        return _results;
      }).call(this)).join("\n");
    };

    Log.prototype.getLongLog = function() {
      var j, o;
      return ((function() {
        var _i, _len, _ref, _results;
        _ref = this.LOG;
        _results = [];
        for (j = _i = 0, _len = _ref.length; _i < _len; j = ++_i) {
          o = _ref[j];
          _results.push(get_long_line(o, j));
        }
        return _results;
      }).call(this)).join("\n");
    };

    Log.prototype.getServerTimeDiff = function() {
      return this.getCurrentSec() - this.getLastTimeSec();
    };

    Log.prototype.getTimeLength = function() {
      return this.getLastTimeSec() - this.getFirstTimeSec();
    };

    Log.prototype.getFirstTime = function() {
      return this.LOG[0].time;
    };

    Log.prototype.getFirstTimeSec = function() {
      return this.LOG[0].timeSec;
    };

    Log.prototype.getLastTime = function() {
      return this.LOG[this.count() - 1].time;
    };

    Log.prototype.getLastTimeSec = function() {
      return this.LOG[this.count() - 1].timeSec;
    };

    Log.prototype.count = function() {
      return this.LOG.length;
    };

    Log.prototype.getRecordsPerSecond = function() {
      return this.count() / this.getTimeLength();
    };

    return Log;

  })();

}).call(this);

/*
//@ sourceMappingURL=Log.map
*/
