WDI = WDI || {}

WDI.app = angular.module("Poster", ["ngResource", 'WDI.factories'])

@PostingCtrl = ["$scope", "Post", ($scope, Post) ->
  $scope.posts = Post.query()

  $scope.addPost = ->
    post = Post.save($scope.newPost)
    console.log post
    $scope.posts.push(post)
    $scope.newPost = {}
]

@CommentingCtrl = ["$scope", "Comment", "$http", ($scope, Comment, $http) ->
  $scope.comments = Comment.query({post_id: @post_id, id: @id})

  $scope.addComment = (post_id, text) ->
    console.log post_id
    $http.post("/posts/" + post_id + "/comments", text).success ->
      $http.get("/posts").success console.log "good"
]
