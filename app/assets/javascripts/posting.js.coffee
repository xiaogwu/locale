WDI = WDI || {}

WDI.app = angular.module("Poster", ["ngResource", 'WDI.factories'])

@PostingCtrl = ["$scope", "Post", ($scope, Post) ->
  $scope.posts = Post.query()

  $scope.addPost = ->
    post = Post.save($scope.newPost)
    $scope.posts.push(post)
    $scope.newPost = {}

]

