import Vapor
import Fluent
import FluentPostgresDriver


// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "",database: "quizappdb"), as: .psql)
    
    // migrations
    app.migrations.add(CreateTestsTableMigration())
    app.migrations.add(CreateQuestionTableMigration())
    
    
    // register controller
    try app.register(collection: TestsController())
    // register routes
    try routes(app)
}
