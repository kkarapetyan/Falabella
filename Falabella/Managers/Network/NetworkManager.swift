//
//  NetworkManager.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case badRequest(message: String)
    case serverError
}

typealias Completion = (_ result: Swift.Result<Any, NetworkError>?) -> ()
let Data_URL = "https://www.mindicador.cl/api"
let testURL = "https://jsonplaceholder.typicode.com/users"


class NetworkManager: NSObject {
    
    
    static func request<T: Decodable>(type: T.Type, completion: @escaping (_ result: Result<T?, NetworkError>) -> Void) {
        AF.request(Data_URL).response { (result) in
            
                        guard (200 ... 299) ~= result.response?.statusCode ?? 0 else {
                            if (400...499).contains(result.response?.statusCode ?? 0) {
                                completion(.failure(.badRequest(message: result.error?.localizedDescription ?? "Bad Request")))
                            } else {
                                completion(.failure(.serverError))
                            }
                            return
                        }
            completion(.success(result.data as? T))
                    }
            
        }
        
//        AF.request(Data_URL).responseDecodable(of: T.self) { (result) in
//
//            guard (200 ... 299) ~= result.response?.statusCode ?? 0 else {
//                if (400...499).contains(result.response?.statusCode ?? 0) {
//                    completion(.failure(.badRequest(message: result.error?.localizedDescription ?? "Bad Request")))
//                } else {
//                    completion(.failure(.serverError))
//                }
//                return
//            }
//            completion(.success(result.value))
//        }
 //   }
    
    
//
//    static func request<T: Decodable>(type: T.Type, completion: @escaping (_ result: Result<T?, NetworkError>) -> Void) {
//
//        AF.request(Data_URL).responseDecodable(of: T.self) { (result) in
//
//            guard (200 ... 299) ~= result.response?.statusCode ?? 0 else {
//                if (400...499).contains(result.response?.statusCode ?? 0) {
//                    completion(.failure(.badRequest(message: result.error?.localizedDescription ?? "Bad Request")))
//                } else {
//                    completion(.failure(.serverError))
//                }
//                return
//            }
//            completion(.success(result.value))
//        }
//    }
//
    
//    static func requestToPath(_ path: String, method: HTTPMethod, params: [String: Any]?, files: [File]? = nil, completion: @escaping (_ value: Any?,_ status: Bool) -> Void) {
//        let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
//        if reachabilityManager!.isReachable {
//            if path.count == 0 {
//                print("Networlk Error: No request Endpoint")
//                return
//            }
//            
//            let url = BASE_URL.prodNew.rawValue + path
//            
//            var headers: HTTPHeaders = [
//                "Accept": "application/json"
//            ]
//            
//            if path.contains("qr/scanner") {
//                headers["fingerPrint"] = params!["fingerPrint"] as? String
//            }
//            
//            if let userToken = UserDefaults.standard.value(forKey: "userToken") as? String {
//                if userToken.count > 0 {
//                    headers["Authorization"] = "Bearer \(userToken)"
//                }
//            }
//            print("method = \(method)")
//            print("requesr URL = \(url)")
//            print("headers = \(headers)")
//            print("params = ", params as Any)
//            
//            Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON {
//                response in
//                
//                if response.response?.statusCode == 401 && !response.result.debugDescription.contains("Invalid username or password") {
//                    let vc = SignInViewController.initFromStoryboard(name: Constant.Storyboards.signIn)
//                        let navVC = UINavigationController(rootViewController: vc)
//                        UIApplication.shared.keyWindow?.rootViewController = navVC
//                        UIApplication.shared.keyWindow?.makeKeyAndVisible()
//                    return
//                }
//                switch response.result {
//                case .success:
//                    print(response)
//                    completion(response.value, true)
//                    break
//                case .failure(let error):
//                    completion(response.value, false)
//                    print(error)
//                }
//            }
//            
//        } else {
//            DispatchQueue.main.async {
//                UIApplication.shared.keyWindow?.rootViewController?.showLitAlert(.important(isSuccess: false, message: "No Internet", buttonTitle: "OK", action: nil))
//            }
//            completion(nil, false)
//        }
//    }
    
//    static func requestToQueryPath(_ path: String, method: HTTPMethod, params: [String: Any]?, files: [File]? = nil, completion: @escaping (_ value: Any?,_ status: Bool) -> Void, uploadProgress: ((_ value: Double?,_ status: Bool) -> Void)? = nil) {
//           
//        let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
//        if reachabilityManager!.isReachable {
//           if path.count == 0 {
//               print("Networlk Error: No request Endpoint")
//               return
//           }
//           
//            let url = BASE_URL.prodNew.rawValue + path
//            var headers = ["Accept": "application/json"]
//            if let userToken = UserDefaults.standard.value(forKey: "userToken") as? String {
//                if userToken.count > 0 {
//                    headers["Authorization"] = "Bearer \(userToken)"
//                }
//            }
//            if files != nil {
//                headers["Content-Type"] = "multipart/form-data"
//                Alamofire.upload(multipartFormData: { multipartFormData in
//                    //Parameter for Upload files
//                    for file in files! {
//                        multipartFormData.append(file.data, withName: file.fileName, fileName: file.name(), mimeType: file.mime)
//                    }
//                }, usingThreshold:UInt64.init(),
//                   to: url, //URL Here
//                    method: .post,
//                    headers: headers, //pass header dictionary here
//                    encodingCompletion: { (result) in
//                        
//                        switch result {
//                        case .success(let upload, _, _):
//                            print("the status code is :")
//                            
//                            upload.uploadProgress(closure: { (progress) in
//                                print("progress.fractionCompleted = \(progress)")
//                                if uploadProgress != nil {
//                                    uploadProgress!(progress.fractionCompleted, progress.fractionCompleted == 1.0 ? true : false)
//                                }
//                            })
//                            
//                            upload.responseJSON { response in
//                                print("the resopnse code is : \(String(describing: response.response?.statusCode))")
//                                print("the response is : \(response)")
//                                
//                                switch response.result {
//                                case .success:
//                                    completion(response.value, true)
////                                    completion(String(data: response.data!, encoding: .utf8),true)
//                                case .failure(let error):
//                                    print(error)
//                                    UIApplication.shared.keyWindow?.rootViewController?.showLitAlert(.important(isSuccess: false, message: error.localizedDescription , buttonTitle: "OK", action: nil))
//                                }
//                                
//                            }
//                            break
//                        case .failure(let encodingError):
//                            print("the error is  : \(encodingError.localizedDescription)")
//                            break
//                        }
//                        
//                        
//                        })
//                
//                
//            } else {
//                
//                Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding(destination: .queryString), headers: headers).responseJSON {
//                    response in
//                    switch response.result {
//                    case .success:
//                        print(response)
//                        completion(response.value, true)
//                        break
//                    case .failure(let error):
//                        completion(response.value, false)
//                        print(error)
//                    }
//                }
//                
////                Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
////
////                    if response.response?.statusCode ?? 0 >= 200 && response.response!.statusCode <= 299 {
////                        completion(response.value, true)
////                    } else {
////                        completion(response.value, false)
////                    }
////                }
//            }
//        } else {
//            DispatchQueue.main.async {
//                UIApplication.shared.keyWindow?.rootViewController?.showLitAlert(.important(isSuccess: false, message: "No Internet", buttonTitle: "OK", action: nil))
//            }
//            completion(nil, false)
//        }
//       }
//    

}
