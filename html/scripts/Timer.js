// Generated by CoffeeScript 1.6.3
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.Timer = (function() {
    var action, callback, doTheJob, timer;

    timer = null;

    function Timer() {
      this.start = __bind(this.start, this);
      this.stop = __bind(this.stop, this);
      if (typeof console !== "undefined" && console !== null) {
        console.log("Timer  created");
      }
    }

    callback = null;

    Timer.prototype.setCallback = function(func) {
      return callback = func;
    };

    Timer.prototype.stop = function() {
      return clearInterval(timer);
    };

    Timer.prototype.start = function(updateTime) {
      if (updateTime == null) {
        updateTime = 1000;
      }
      this.stop();
      doTheJob();
      return timer = setInterval(doTheJob, updateTime);
    };

    doTheJob = function() {
      action();
      return typeof callback === "function" ? callback() : void 0;
    };

    action = function() {};

    return Timer;

  })();

}).call(this);

/*
//@ sourceMappingURL=Timer.map
*/
