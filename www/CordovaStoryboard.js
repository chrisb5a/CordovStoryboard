var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'CordovaStoryboard', 'coolMethod', [arg0]);
};


module.exports.getUserData = function (arg0, success, error) {
    exec(success, error, 'CordovaStoryboard', 'getUserData', [arg0]);
    };
    

exports.echojs = function(arg0, success, error) {
    if (arg0 && typeof(arg0) === 'string' && arg0.length > 0) {
      success(arg0);
    } else {
      error('Empty message!');
    }
  };

  