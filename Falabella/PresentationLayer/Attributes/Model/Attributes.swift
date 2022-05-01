//
//  Attributes.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import Foundation


//struct Attributes: Decodable {
//   // let firstString: String
////let stringArray: [String]
//
//    init(from decoder: Decoder) throws {
//        var container = try decoder.unkeyedContainer()
//       // firstString = try container.decode(String.self)
//       // stringArray = try container.decode([String].self)
//    }
//}






//struct Attributes: Decodable {
//    let codigo : String
//    let nombre : String
//    let unidad_medida : String
//    let fecha : String
//    let valor : Double
//
//    init(from decoder: Decoder) throws {
//
//        var container = try decoder.unkeyedContainer()
//        codigo = try container.decode(String.self, forKey: "codigo")
//       // nombre = try container.decode([String].self, forkey. nombre)
//
//
////        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
////        let nestedContainer = try rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
////        var unkeyedContainer = try nestedContainer.nestedUnkeyedContainer(forKey: .codigo)
////        let coinContainer = try unkeyedContainer.nestedContainer(keyedBy: CodingKeys.self)
////        codigo = try coinContainer.decode(String.self, forKey: .codigo)
////        nombre = try coinContainer.decode(Double.self, forKey: .nombre)
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case codigo
//        case nombre
//        case name
//        case price
//    }
//}

//struct Attributes: Decodable {
//        let JSON: [Any]
//
//        init(from decoder: Decoder) throws {
//            var container = try decoder.unkeyedContainer()
//            let firstString = try container.decode(String.self)
//            let stringArray = try container.decode([String].self)
//            JSON = [firstString, stringArray]
//        }
//    //let name: String
//}


//struct Attributes: Decodable {
//    public var innerArray: [String: Inner]
//
//    public struct Inner: Codable {
//           let codigo : String
//           let nombre : String
//           let unidad_medida : String
//           let fecha : String
//           let valor : Double
//    }
//
//    private struct CustomCodingKeys: CodingKey {
//        var stringValue: String
//        init?(stringValue: String) {
//            self.stringValue = stringValue
//        }
//        var intValue: Int?
//        init?(intValue: Int) {
//            return nil
//        }
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CustomCodingKeys.self)
//
//        self.innerArray = [String: Inner]()
//        for key in container.allKeys {
//            let value = try container.decode(Inner.self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
//            self.innerArray[key.stringValue] = value
//        }
//    }
//}
////    let version: String
////    let autor: String
////    let fecha: String
////    let all: [Test]
////
////    enum CodingKeys: Test, CodingKey {
////
////        let tset: Test
////
////     }
//}




//struct Response: Decodable {
//    let version: String
//    let autor: String
//    let fecha: String
//    let valuta: [[String: [Valuta]]]
//    
//    enum CodingKeys: String, CodingKey {
//        
//        let version
//        let autor
//        let fecha
//        let valuta
//       }
//    
//    init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            
//        version = try container.decode(String.self, forKey: .version)
//        autor = try container.decode(String.self, forKey: .autor)
//        fecha = try container.decode(String.self, forKey: .fecha)
//
//            var unkeyedContainer = try container.nestedUnkeyedContainer(forKey: .addresses)
//            var valuta = [[String: [Valuta]]]()
//            while !unkeyedContainer.isAtEnd {
//                do {
//                    let sindleAddress = try unkeyedContainer.decode([String: Valuta].self)
//                    valuta.append(sindleAddress.mapValues { [$0] } )
//                } catch DecodingError.typeMismatch {
//                    valuta.append(try unkeyedContainer.decode([String: [Valuta]].self))
//                }
//            }
//            self.valuta = valuta
//        }
//}
//
//


struct Attributes: Decodable {
    var codigo : String = ""
    var nombre : String = ""
    var unidad_medida : String = ""
    var fecha : String = ""
    var valor : Double = 0
}

struct Valuta: Decodable {
    let codigo : String
    let nombre : String
    let unidad_medida : String
    let fecha : String
    let valor : Double
}
