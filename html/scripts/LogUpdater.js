// Generated by CoffeeScript 1.6.3
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.LogUpdater = (function() {
    var callback, timer, updateLog;

    timer = null;

    function LogUpdater() {
      this.init = __bind(this.init, this);
      this.start = __bind(this.start, this);
      this.stop = __bind(this.stop, this);
      if (typeof console !== "undefined" && console !== null) {
        console.log("LogUpdater created");
      }
    }

    callback = null;

    LogUpdater.prototype.onTimer = function(func) {
      callback = func;
      return typeof console !== "undefined" && console !== null ? console.log(func) : void 0;
    };

    LogUpdater.prototype.stop = function() {
      return clearInterval(timer);
    };

    LogUpdater.prototype.start = function(updateTime) {
      if (updateTime == null) {
        updateTime = 5000;
      }
      this.stop();
      updateLog();
      return timer = setInterval(updateLog, updateTime);
    };

    updateLog = function() {
      var _this = this;
      this.myLog = new Log();
      return $.get(GLOB.FULL_URL, function(txt) {
        if (typeof console !== "undefined" && console !== null) {
          console.log("updated: " + (txt.substr(0, 10)));
        }
        _this.myLog.addText(txt);
        if (typeof callback === "function") {
          callback(_this.myLog);
        }
        return null;
      });
    };

    LogUpdater.prototype.init = function() {
      clearInterval(timer);
      return this.myLog = new Log();
    };

    return LogUpdater;

  })();

}).call(this);

/*
//@ sourceMappingURL=LogUpdater.map
*/
