import Foundation
import MongoKitten
import Darwin

let file: String! = CommandLine.arguments[1]

if file != nil { // Verify if file is valid

    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    
    let finalPath = dir.absoluteString+file!
    do{
        let textFile = try String(contentsOf: URL(string: finalPath )! , encoding: String.Encoding.utf8)
        let oQueue = OperationQueue()
        
        oQueue.name = "com.wschultz"
        oQueue.qualityOfService = .utility
        oQueue.maxConcurrentOperationCount = 1000
   
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let x = "123"
        let mongo = MongoHandler(user: "user", password: "123", database: "articlesdb")
        
        for sUrl in textFile.components(separatedBy: "\n"){
        let url = URL(string: sUrl)!
        
            let op = WSRequest(url: url, session: session){ (data,response,error) in
                let stringValue =  String(data: data!, encoding: String.Encoding.utf8)!
                let title =  stringValue.getStringBetweenStrings(beginString: "<title>",endString:"</title>") ?? "Esse foi nulo"
                let body  =  stringValue.getStringBetweenStrings(beginString: "<p>",endString:"</p>") ?? "Esse foi nulo"
                mongo.save(collection: "Article",title: title,body: body)
            }
            oQueue.addOperation(op)
    }
   
        oQueue.waitUntilAllOperationsAreFinished()
        
    }catch{
        debugPrint("Read/Write error")
    }
  }

} else {
    debugPrint("Wrong arguments")
    exit(0)
}

