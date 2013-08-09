// Generated by CoffeeScript 1.6.3
(function() {
  this.LogSummary = (function() {
    var desk, outerContainer;

    function LogSummary() {}

    desk = null;

    outerContainer = null;

    LogSummary.prototype.clear = function() {
      return desk.html("");
    };

    LogSummary.prototype.write = function(text) {
      return desk.html(desk.html() + text);
    };

    LogSummary.prototype.show = function(log) {
      var error;
      this.clear();
      try {
        return this.write("<h4>Summary</h4>\n<pre>\nCurrent Time        " + (log.getCurrentTime()) + " " + (log.getCurrentSec()) + "\nServer Difference   " + (log.getServerTimeDiff().toFixed(2)) + "\n\nFirst record time   " + (log.getFirstTime()) + " " + (log.getFirstTimeSec().toFixed(3)) + "\nLast record time    " + (log.getLastTime()) + " " + (log.getLastTimeSec().toFixed(3)) + "\nTime length         " + (log.getTimeLength().toFixed(2)) + "  sec\n\nRequests            " + (log.count()) + "\nRequests Per Second " + (log.getRecordsPerSecond().toFixed(2)) + "\n</pre>");
      } catch (_error) {
        error = _error;
        return this.write("<pre style='font-size:20px; color:red'>\n-----------------------\n" + (error.toString()) + "\n-----------------------\n</pre>");
      }
    };

    LogSummary.prototype.buildSummaryArea = function(containerSelector) {
      outerContainer = $(containerSelector);
      desk = $("        <div style='position:relative;        left:0px; top:0px;        width:400px;        border:1px dotted silver;        color:black;        overflow-x:hidden;        '><div>");
      return outerContainer.append(desk);
    };

    return LogSummary;

  })();

}).call(this);

/*
//@ sourceMappingURL=LogSummary.map
*/
