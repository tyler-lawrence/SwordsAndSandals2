//
//  AppManager.swift
//  SwordsAndSandals2
//
//  Created by Tyler Lawrence1 on 12/5/23.
//

import Foundation

@Observable
final class AppManager {
    
    var gameManagers: [GameManager] = []
    var selectedGame: GameManager?
    var appState: AppState = .setup
    
    init(gameManagers: [GameManager]) {
        self.gameManagers = gameManagers
    }
    
    init() {
        self.gameManagers = readGameManagersFromDisk()
    }
    
    func readGameManagersFromDisk() -> [GameManager] {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            let encodedGameManagers = try Data(
                contentsOf: directory.appendingPathComponent("GameManager.json")
            )
            let decodedGameManagers = try JSONDecoder().decode([GameManager].self, from: encodedGameManagers)
            return decodedGameManagers
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    func saveGame(_ gameManager: GameManager) {
        gameManagers.append(gameManager)
        save()
    }
    
    func save() {
        do {
            let directory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            )
            
            try JSONEncoder().encode(gameManagers).write(to: directory.appendingPathComponent("GameManager.json"))
        } catch {
            debugPrint(error)
        }
    }
    
    func idxForGame(_ gameManager: GameManager) -> Int? {
        gameManagers.firstIndex{$0.id == gameManager.id}
    }
    
    func remove(gameManager: GameManager) {
        if let idx = idxForGame(gameManager) {
            gameManagers.remove(at: idx)
            selectedGame = nil
        }
    }
    
    func remove(at offsets: IndexSet){
        gameManagers.remove(atOffsets: offsets)
    }
}

#if DEBUG
extension AppManager{
    static let sample = AppManager(gameManagers: [GameManager()])
}
#endif
