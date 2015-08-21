'user strict'

angular.module('messangerApp').controller('ConversationsCtrl', ['$scope', '$auth', 'Conversation', function($scope, $auth, Conversation){

  $scope.converstations = [];
  Conversation.query(function(data){
    $scope.converstations = data;
  });
}]);
