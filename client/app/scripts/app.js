'use strict';

/**
 * @ngdoc overview
 * @name messangerApp
 * @description
 * # messangerApp
 *
 * Main module of the application.
 */
var app = angular
  .module('messangerApp', [
    'ngAnimate',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ng-token-auth'
  ])

  app.config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/conversations/index.html',
        controller: 'ConversationsCtrl'
      })
      .when('/sign_up', {
        templateUrl: 'views/user_registrations/new.html',
        controller: 'UserRegistrationsCtrl',
      })
      .when('/conversations', {
        templateUrl: 'views/conversations/index.html',
        controller: 'ConversationsCtrl',
      })
      .when('/sign_in', {
        templateUrl: 'views/user_sessions/new.html',
        controller: 'UserSessionsCtrl'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about'
      })
      .otherwise({
        redirectTo: '/'
      });
  });

  app.run(['$rootScope', '$location', function($rootScope, $location) {
  $rootScope.$on('auth:login-success', function() {
    $location.path('/');
  });
}]);

app.factory('Conversation', ['$resource', function($resource) {
  return $resource('/api/conversations/:conversation_id');
}]);
