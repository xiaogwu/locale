WDI = WDI || {}

WDI.app = angular.module("Poster", ["ngResource", 'WDI.factories'])

WDI.app.directive "ngFocus", ["$parse", ($parse) ->
  (scope, element, attr) ->
    fn = $parse(attr["ngFocus"])
    element.bind "focus", (event) ->
      scope.$apply ->
        fn scope,
          $event: event
]

@PostingCtrl = ["$scope", "Post", "$http", ($scope, Post, $http) ->
  $scope.posts = Post.query()

  $scope.addPost = ->

    getCookie = (c_name) ->
      c_value = document.cookie
      c_start = c_value.indexOf(" " + c_name + "=")
      c_start = c_value.indexOf(c_name + "=")  if c_start is -1
      if c_start is -1
        c_value = null
      else
        c_start = c_value.indexOf("=", c_start) + 1
        c_end = c_value.indexOf(";", c_start)
        c_end = c_value.length  if c_end is -1
        c_value = unescape(c_value.substring(c_start, c_end))
      c_value


    post = Post.save($scope.newPost)
    console.log post
    console.log getCookie("lat_lng_post").split "|"
    $scope.posts.push(post)
    $scope.newPost = {}

  $scope.addComment = (post_id, text) ->
    console.log post_id
    $http.post("/posts/" + post_id + "/comments", text).success ->
      console.log "success!"
      $scope.posts = Post.query()
      # $http.get("/posts").success ->

  $scope.getGPS = () ->
    savePosition = (position) ->
      console.log position.coords.latitude
      console.log position.coords.longitude
      cookie_val = position.coords.latitude + "|" + position.coords.longitude
      document.cookie = "lat_lng_post=" + escape(cookie_val)

    if navigator.geolocation
      navigator.geolocation.getCurrentPosition savePosition
    else
      alert "Geolocation is not supported by this browser."
]

@CommentingCtrl = ["$scope", "Comment", "$http", ($scope, Comment, $http) ->
  # $scope.comments = Comment.query({post_id: @post_id, id: @id})

  # $scope.addComment = (post_id, text) ->
  #   console.log post_id
  #   $http.post("/posts/" + post_id + "/comments", text).success ->
  #     console.log "success!"
  #     # $http.get("/posts").success ->
  #     #   console.log "good"
]
