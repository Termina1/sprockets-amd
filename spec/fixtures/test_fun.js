AMD.module.App.FindOutFsm = function(inviteService) {
  return new AMD.require.machina.Fsm({
    beingBusy: function(action, reaction, args) {
      var _this = this;
      this.transition('busy');
      return action(args, function() {
        _this.transition('ready');
        return reaction.apply(_this, arguments);
      });
    },
    initialState: 'ready',
    states: {
      'ready': {
        invite: function(args, callback) {
          return this.beingBusy(inviteService.genericInvite, callback, args);
        },
        connect: function(source, callback) {
          return this.beingBusy(inviteService.connectNet, callback, source);
        }
      },
      'busy': {
        invite: function(source, callback) {},
        connect: function(callback) {}
      }
    }
  });
};
