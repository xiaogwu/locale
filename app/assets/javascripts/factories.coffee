factoriesModule = angular.module('WDI.factories', [])

factoriesModule.factory "Post", ["$resource", ($resource) ->
  $resource("/posts/:id", {id: "@id"},{
    update: {method: "PUT"}
  })
]

factoriesModule.factory "Comment", ["$resource", ($resource) ->
  $resource("/posts/46/comments/:id", {id: "@id"},
    index:  { method: 'GET',  url: '/posts/:post_id/comments', isArray: true },
    create: { method: 'POST', url: '/posts/:post_id/comments' },
    update: {method: "PUT"}
  )
]
