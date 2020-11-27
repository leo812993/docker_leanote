db.createUser(
  {
    user: "note",
    pwd: "lwx812993",
    roles: [ { role: "readWrite", db: "leanote" } ]
  }
)