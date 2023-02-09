//
//  NSManagedObject+Utils.swift
//  SeeMovies
//
//  Created by José Vitor Scheffer Boff dos Santos on 09/02/23.
//

import Foundation
import CoreData
import UIKit

extension NSManagedObject {
    class var viewContext: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }
    
    @discardableResult
    class func save(context: NSManagedObjectContext) -> Bool {
        do {
            try context.save()
            return true
        } catch {
            print("Failed to save NSManagedObjectContext.")
            return false
        }
    }
    
    class func fetch<T: NSManagedObject>(entityClass: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor] = [], context: NSManagedObjectContext, fetchOffset: Int? = nil, fetchLimit: Int? = nil) -> [T]? {
        let entityName = NSStringFromClass(entityClass)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        if let offset = fetchOffset, let limit = fetchLimit {
            request.fetchOffset = offset
            request.fetchLimit = limit
        }
        
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.returnsObjectsAsFaults = false
        
        do {
            guard let result = try context.fetch(request) as? [NSManagedObject] else { return nil }
            var resultsFetch: [T] = []
            for item in result {
                guard let data = item as? T else { continue }
                resultsFetch.append(data)
            }
            return resultsFetch
        } catch {
            return nil
        }
    }
    
    class func fetchFirst<T: NSManagedObject>(entityClass: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor] = [], context: NSManagedObjectContext, fetchOffset: Int? = nil, fetchLimit: Int? = nil) -> T? {
        return fetch(entityClass: entityClass, predicate: predicate, sortDescriptors: sortDescriptors, context: context, fetchOffset: fetchOffset, fetchLimit: 1)?.first
    }
    
    class func delete(_ object: NSManagedObject, withContext context: NSManagedObjectContext) {
        do {
            context.delete(object)
            try context.save()
        }
        catch {
            print("Error saving NSManagedObjectContext for deletion.")
        }
    }
    
    @discardableResult
    static func deleteAll<T: NSManagedObject>(entityClass: T.Type, withContext context: NSManagedObjectContext) -> Bool {
        if let result = fetch(entityClass: T.self, context: context) {
            for object in result {
                context.delete(object)
            }
            do {
                try context.save()
                return true
            } catch {
                print("Error saving NSManagedObjectContext for deletion.")
                return false
            }
        }
        return true
    }
}
