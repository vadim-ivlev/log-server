// Generated by CoffeeScript 1.6.3
(function() {
  var summary, updater;

  this.GLOB = new Common;

  updater = new LogUpdater;

  summary = new LogSummary;

  $(function() {
    summary.buildSummaryArea("#out2");
    updater.init();
    updater.onUpdate(function(log) {
      return summary.show(log);
    });
    $("#btnStart0").click(function() {
      return updater.start(5000);
    });
    return $("#btnStop0").click(function() {
      return updater.stop();
    });
  });

}).call(this);

/*
//@ sourceMappingURL=index.map
*/
