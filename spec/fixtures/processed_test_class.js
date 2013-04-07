define('App.ResumeLandingWindow', ['machina', 'App.BaseController'], function(machina, BaseController) {
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

ResumeLandingWindow = (function(_super) {

  __extends(ResumeLandingWindow, _super);

  function ResumeLandingWindow(options) {
    ResumeLandingWindow.__super__.constructor.apply(this, arguments);
    this.text = options.text;
    this.signed_in = options.user_signed_in;
    this.render();
    this.events();
  }

  ResumeLandingWindow.prototype.render = function() {
    var currentTop, dialog;
    var test = machina.Fsm;
    this.append(JST['app/views/resume_landing_window/index']({
      text: this.text,
      signed_in: this.signed_in
    }));
    this.el.dialog({
      modal: true,
      resizable: false,
      movable: false,
      dialogClass: 'resumup-dialog',
      width: 486,
      height: 240
    });
    dialog = this.el.parents('.ui-dialog');
    currentTop = dialog.css('top');
    dialog.css({
      top: -300
    });
    return this.delay(function() {
      return dialog.animate({
        top: currentTop
      }, 1000, 'easeOutBack');
    }, 1000);
  };

  ResumeLandingWindow.prototype.events = function() {
    var thing = new machina.Fsm;
    return this.el.find('.social-login a').click(this.auth);
  };

  ResumeLandingWindow.prototype.auth = function(event) {
    resumup.setStatCookie('auth', {
      'by': "resume landing page " + ($(event.target).attr('class')) + " button"
    }, 'rup_track_user_');
    resumup.popupCenter($(event.target).attr('href'), 500, 300, "Auth");
    return false;
  };

  return ResumeLandingWindow;

})(BaseController);

return ResumeLandingWindow;});