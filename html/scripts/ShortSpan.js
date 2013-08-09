// Generated by CoffeeScript 1.6.3
(function() {
  this.ShortSpan = (function() {
    var desk, outerContainer;

    function ShortSpan() {}

    desk = null;

    outerContainer = null;

    ShortSpan.prototype.beginTime = 10;

    ShortSpan.prototype.clear = function() {
      return desk.html("");
    };

    ShortSpan.prototype.write = function(text) {
      return desk.html(desk.html() + text);
    };

    ShortSpan.prototype.show = function(log, startTime, period) {
      var error, sec0, sec1;
      if (startTime == null) {
        startTime = 10;
      }
      if (period == null) {
        period = 0.5;
      }
      this.clear();
      try {
        return this.write("<h3>Short time span</h3>\n<pre>\nCurrent Time: " + (log.getCurrentTime()) + " " + (log.getCurrentSec()) + "\nStart time: " + this.beginTime + " Period: " + (period.toFixed(3)) + " Frequency: " + (Math.round(1 / period)) + "\n-----------------------\n" + (sec0 = log.getCurrentSec()) + " start filter time\n-----------------------\n" + (log.getPastRecords(startTime, period).join('\n')) + "\n-----------------------\n" + (sec1 = log.getCurrentSec()) + " end filter time\n--------------------------\nfilter time " + (sec1 - sec0) + " seconds\n</pre>");
      } catch (_error) {
        error = _error;
        return this.write("<pre style='font-size:20px; color:red'>\n-----------------------\n" + (error.toString()) + "\n-----------------------\n</pre>");
      }
    };

    ShortSpan.prototype.buildDrawArea = function(containerSelector) {
      outerContainer = $(containerSelector);
      desk = $("<div      style='      position:absolute;      left:550px;      top:0px;      width:550px;      border:1px dotted #F00;      font-family:sans-serif;      color:black;      overflow-x:hidden;      '><div>");
      return outerContainer.append(desk);
    };

    return ShortSpan;

  })();

}).call(this);

/*
//@ sourceMappingURL=ShortSpan.map
*/
