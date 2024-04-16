//
//  RealmManager.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/16/24.
//

import Foundation
import RealmSwift

class UsersBusBookmark: Object {
    @Persisted var busNumber: String
    @Persisted var stationID: String
    @Persisted var isBookmarked: Bool
}

class UsersSubwayRouteBookmark: Object {
    @Persisted var subwayStationNumber: String
    @Persisted var subwayStationID: String
    @Persisted var isBookmarked: Bool
}

class RealmManager {
    
    private var realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    // MARK: - Create
    func saveBusBookmark(busNumber: String, stationID: String) {
        let bookmark = UsersBusBookmark()
        bookmark.busNumber = busNumber
        bookmark.stationID = stationID
        bookmark.isBookmarked = true
        
        try! realm.write {
            realm.add(bookmark)
        }
    }
    
    func saveSubwayBookmark(subwayStationNumber: String, subwayStationID: String) {
        let bookmark = UsersSubwayRouteBookmark()
        bookmark.subwayStationNumber = subwayStationNumber
        bookmark.subwayStationID = subwayStationID
        bookmark.isBookmarked = true
        
        try! realm.write {
            realm.add(bookmark)
        }
    }
    
    // MARK: - Read
    func getAllBusBookmarks() -> Results<UsersBusBookmark> {
        return realm.objects(UsersBusBookmark.self)
    }
    
    func getAllSubwayBookmarks() -> Results<UsersSubwayRouteBookmark> {
        return realm.objects(UsersSubwayRouteBookmark.self)
    }
    
    // MARK: - Delete
    func removeBusBookmark(stationID: String) {
        if let bookmark = realm.objects(UsersBusBookmark.self).first(where: { $0.stationID == stationID }) {
            try! realm.write {
                realm.delete(bookmark)
            }
        }
    }
    
    func removeSubwayBookmark(subwayStationID: String) {
        if let bookmark = realm.objects(UsersSubwayRouteBookmark.self).first(where: { $0.subwayStationID == subwayStationID }) {
            try! realm.write {
                realm.delete(bookmark)
            }
        }
    }
    
    // MARK: - Update (toggle bookmark status)
    func toggleBusBookmark(stationID: String) {
        if let bookmark = realm.objects(UsersBusBookmark.self).first(where: { $0.stationID == stationID }) {
            try! realm.write {
                bookmark.isBookmarked.toggle()
            }
        }
    }
    
    func toggleSubwayBookmark(subwayStationID: String) {
        if let bookmark = realm.objects(UsersSubwayRouteBookmark.self).first(where: { $0.subwayStationID == subwayStationID }) {
            try! realm.write {
                bookmark.isBookmarked.toggle()
            }
        }
    }
}
