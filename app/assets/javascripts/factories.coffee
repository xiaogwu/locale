factoriesModule = angular.module('WDI.factories', [])

factoriesModule.factory "Post", ["$resource", ($resource) ->
  $resource("/posts/:id", {id: "@id"},{
    update: {method: "PUT"}
  })
]

factoriesModule.factory "Comment", ["$resource", ($resource) ->
  $resource("/posts/:post_id/comments/:id", {id: "@id", post_id: "@post_id"},
    update: {method: "PUT"}
  )
]
