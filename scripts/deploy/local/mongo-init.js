db.createUser(
    {
        user: "mongo-user",
        pwd: "mongo-password",
        roles: [
            {
                role: "readWrite",
                db: "auctions-ms-db"
            }
        ]
    }
);