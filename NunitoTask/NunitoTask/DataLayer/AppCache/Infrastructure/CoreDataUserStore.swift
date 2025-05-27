//
//  CoreDataUserStore.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//

import Foundation
import CoreData

public final class CoreDataUserStore {
    // MARK: - Properties
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
    
    enum StoreError: Swift.Error {
        case modelNotFound
        case failedToLoadPersistentContainer(Error)
    }
    
    //MARK: - Initialization
    public init(storeURL: URL, modelName: String, bundle: Bundle = .main) throws {
        guard let model = NSManagedObjectModel.with(
            name: modelName,
            in: Bundle(for: CoreDataUserStore.self)
        ) else {
            throw StoreError.failedToLoadPersistentContainer(
                NSError(domain: "ModelNotFound", code: 0)
            )
        }
        do {
            container = try NSPersistentContainer.load(
                name: modelName,
                model: model,
                url: storeURL
            )
            context = container.newBackgroundContext()
        } catch {
            throw StoreError.failedToLoadPersistentContainer(error)
        }
    }
    
    /// The action is executed on the background context, preventing any blocking of the main thread during data operations.
    /// Executes a throwing action on the background context and returns a result asynchronously.
    func performAsync<T: Sendable>(_ action: @escaping (NSManagedObjectContext) throws -> T) async throws -> T {
        let context = self.context
        return try await withCheckedThrowingContinuation { continuation in
            context.perform {
                do {
                    let result = try action(context) // Perform the action on the context
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func cleanUpReferencesToPersistentStores() {
        context.performAndWait {
            let coordinator = self.container.persistentStoreCoordinator
            try? coordinator.persistentStores.forEach(coordinator.remove)
        }
    }
    
    // MARK: - Deinitialization
    deinit {
        cleanUpReferencesToPersistentStores()
    }
}

