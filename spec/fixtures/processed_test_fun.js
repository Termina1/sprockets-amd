define('App.WindowHeightAdjustable', [], function() {
var WindowHeightAdjustable = {};
(function() {

  WindowHeightAdjustable = {
    adjustHeight: function(bottomPadding) {
      var screenHeight, top,
        _this = this;
      if (bottomPadding == null) {
        bottomPadding = 10;
      }
      top = this.el.offset().top;
      screenHeight = $(window).height();
      this.el.height(screenHeight - top - bottomPadding);
      return $(window).resize(function() {
        _this.adjustHeight(bottomPadding);
        return _this.trigger('adjusted');
      });
    }
  };

}).call(this);
return WindowHeightAdjustable;});