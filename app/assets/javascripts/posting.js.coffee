WDI = WDI || {}

WDI.app = angular.module("Poster", ["ngResource", 'WDI.factories'])

@PostingCtrl = ["$scope", "Post", ($scope, Post) ->
  $scope.posts = Post.query()

  $scope.addPost = ->
    post = Post.save($scope.newPost)
    console.log post
    console.log posts
    $scope.posts.push(post)
    $scope.newPost = {}
]

@CommentingCtrl = ["$scope", "Comment", "$http", ($scope, Comment, $http) ->
  $scope.comments = Comment.query({post_id: @post_id, id: @id})

  $scope.addComment = (post_id, text) ->
    console.log $scope.newComment
    console.log post_id
    console.log text
    $http.post("/posts/" + post_id + "/comments", text).success alert 'hi' 
]
