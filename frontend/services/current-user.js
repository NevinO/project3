'use strict';

/**
 * Service for the current user
 */
angular.module('app').factory('CurrentUser', function($auth, $q, Restangular) {
  var promise,
    currentUser = Restangular.one('users');

  return {
    get: function() {
      return promise || load();
    },
    reload: function() {
      return load();
    },
    reset: function() {
      promise = undefined;
    },
    id: function() {
      return userId();
    },
    isAuthenticated: function() {
      if ($auth.isAuthenticated()) {
        return true;
      } else {
        this.reset();
        return false;
      }
    }
  };

  function load() {
    if ($auth.isAuthenticated()) {
      promise = Restangular.one('users', userId()).get().then(function (user) {
        _.extend(currentUser, user);
        return currentUser;
      }).catch(function () {
        resetCurrentUser();
        return currentUser;
      });
    } else {
      resetCurrentUser();
      promise = $q.when(currentUser);
    }

    return promise;
  }

  function userId() {
    return _.result($auth.getPayload(), 'user.id');
  }

  function resetCurrentUser() {
    _.each(currentUser, function (val, key, obj) {
      !_.isFunction(val) && delete obj[key];
    });
  }
});
