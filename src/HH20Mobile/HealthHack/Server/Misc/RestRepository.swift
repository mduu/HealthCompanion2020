//
//  RestRepository.swift
//  HackZurich

import Foundation
import Alamofire
import Kingfisher

typealias FailureResponse = ((Int?) -> Void)

class RestRepository {
    typealias REST = RestRepository

    
    static var manager: SessionManager!
    static var serverTrustPolicy: ServerTrustPolicy!
    
    func url(_ url: String) -> String {
        let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return Constants.Application.baseUrl + encoded
    }
    
    private static func trustPolicy() -> ServerTrustPolicyManager {
        if serverTrustPolicy == nil {
            serverTrustPolicy = ServerTrustPolicy.pinPublicKeys(
                publicKeys: ServerTrustPolicy.publicKeys(),
                validateCertificateChain: true,
                validateHost: true)
        }
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            Constants.Application.trustedHost: serverTrustPolicy
        ]
        return ServerTrustPolicyManager(policies: serverTrustPolicies)
    }
}

class HealthHackSessionManager : SessionManager {
    
    #if DEBUG
    // For debug builds we would like to print all requests and responses
    var dataTaskWillCacheResponseWithCompletionOld: ((URLSession, URLSessionDataTask, CachedURLResponse, @escaping (CachedURLResponse?) -> Void) -> Void)?

    override open func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest
    {
        var urlString = ""
        var params = "No Parameters"
        if let string = try? url.asURL().debugDescription {
            urlString = string
        }
        if let value = parameters {
            params = value.debugDescription
        }
        var debugString = "\(method.rawValue)\n\t\(urlString)\n\tParameters: \(params)"
        let maxLength = 1000
        debugString = debugString.lengthOfBytes(using: .utf8) > maxLength ? (debugString as NSString).substring(to: maxLength) : debugString
        print(debugString)
        return super.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    #endif
}
