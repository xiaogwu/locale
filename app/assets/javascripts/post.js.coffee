WDI = WDI || {}

WDI.app = angular.module("Raffler", ["ngResource", 'WDI.factories', 'WDI.directives'])

@TestCtrl = ["$scope", ($scope) ->
  $scope.name = 'Markus'
]

@PostCtrl = ["$scope", "Post", ($scope, Post) ->
  $scope.posts = Post.query()

  $scope.addPost = ->
    post = Post.save($scope.newPost)
    $scope.posts.push(post)
    $scope.newPost = {}

]
