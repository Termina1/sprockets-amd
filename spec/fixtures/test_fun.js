(function() {

  AMD.module.App.WindowHeightAdjustable = {
    adjustHeight: function(bottomPadding) {
      var screenHeight, top,
        _this = this;
      if (bottomPadding == null) {
        bottomPadding = 10;
      }
      result = 'App.SomeTest';
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