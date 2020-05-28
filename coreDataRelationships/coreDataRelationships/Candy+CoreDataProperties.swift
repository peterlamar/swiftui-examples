//
//  Candy+CoreDataProperties.swift
//  coreDataRelationships
//
//  Created by Peter Lamar on 5/28/20.
//  Copyright © 2020 Peter Lamar. All rights reserved.
//
//

import CoreData
import Foundation

extension Candy {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}
