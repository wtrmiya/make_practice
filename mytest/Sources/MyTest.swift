// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@main
@MainActor
struct MyTest {
    static let arguments = CommandLine.arguments
    static func main() throws {
        let fileManager = FileManager.default
        
        let currentDirectory = fileManager.currentDirectoryPath
        
        let directoryToMake: String = "output"
        let subDirectoryPath = currentDirectory.appending("/\(directoryToMake)")
        
        let fileNameToMake = "hello.txt"
        let outputFilePath = subDirectoryPath.appending("/\(fileNameToMake)")
        
        let contents = "Hello!!"
        let contentsData = contents.data(using: .utf8)
        
        do {
            if !fileManager.fileExists(atPath: subDirectoryPath) {
                try fileManager.createDirectory(atPath: subDirectoryPath, withIntermediateDirectories: true)
                print("created directory: ./\(directoryToMake)")
            } else {
                print("directory already exists: ./\(directoryToMake)")
            }
            
            if !fileManager.fileExists(atPath: outputFilePath) {
                fileManager.createFile(atPath: outputFilePath, contents: contentsData)
            } else {
                print("file already exists: ./\(subDirectoryPath)/\(fileNameToMake)")
            }
        } catch {
            print(error)
        }
    }
}

