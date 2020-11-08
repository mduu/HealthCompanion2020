//
//  RestManager.swift
//  HackZurich


import Foundation
import Kingfisher


enum HttpMethod: String, Codable {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}


enum CustomNetworkError: Error {
    case noConnection
    case serverError
    case clientError
    case clientErrorTimeout
    case noData
    case tokenExpired
    case success(data: Data)
}

private class RestRequest: NSObject {
    let urlRequest: URLRequest

    init(urlRequest: URLRequest) {
        self.urlRequest = urlRequest
    }


    override var description: String {
        var value = "\(super.description) \n"
        for attribute in Mirror(reflecting: self).children {
            value += " - \(attribute.label ?? "Label"): \(attribute.value) \n"
        }
        return value
    }
}

struct NoData: Codable {}

class RestManager: NSObject {

    // MARK: - Attributes
    static let shared = RestManager()
    private lazy var session = URLSession(configuration: URLSessionConfiguration.default)


    func loadAnmimation(url: URL, completion: @escaping([AnyHashable : Any]?) -> Void) {
        var request = RestManager.addHeaders(toRequest: URLRequest(url: url))
        request.httpMethod = HttpMethod.get.rawValue
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let object = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? [AnyHashable : Any] else {
                completion(nil)
                return
            }
            completion(object)
        }.resume()
    }
    
    static var requestModifier: AnyModifier {
        return AnyModifier { request in
            var request = addHeaders(toRequest: request)
            request.cachePolicy = .useProtocolCachePolicy
            return request
        }
    }
    
    static func addHeaders(toRequest request: URLRequest) -> URLRequest {
        let request = request
        
        
        return request
        
    }

    // MARK: - Public methods
    func request<T>(urlString: String, httpMethod: HttpMethod, parameters: Codable?, type: T.Type, callback: @escaping (T?, Error?) -> Void) where T: Codable {
        guard let serviceUrl = url(urlString) else { return }
        // var request = URLRequest(url: serviceUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        var request = URLRequest(url: serviceUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        
        if let userID = UserDefaults.standard.value(forKey: LoginConfig.kCurrentUserGUID) as? String {
            request.setValue(userID, forHTTPHeaderField: "userid")
        }
        
        
        
        if let parameters = parameters, let httpBody = try? parameters.data() {
            request.httpBody = httpBody
        }
        fire(request: RestRequest(urlRequest: request), type: type, callback: callback)
    }
    
    func requestFoodApi<T>(httpMethod: HttpMethod, parameters: Codable?, type: T.Type, callback: @escaping (T?, Error?) -> Void) where T: Codable {
        guard let serviceUrl = URL(string: "https://api-beta.bite.ai/vision/") else { return }
        // var request = URLRequest(url: serviceUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        var request = URLRequest(url: serviceUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        //request.setValue("70361090-20fb-11eb-adc1-0242ac120002", forHTTPHeaderField: "userid")
        request.setValue("Bearer ab256e405dbae6bdd5feaa217b10300fdf51e44f", forHTTPHeaderField: "Authorization")

        if let parameters = parameters, let httpBody = try? parameters.data() {
            request.httpBody = httpBody
        }
        fire(request: RestRequest(urlRequest: request), type: type, callback: callback)
    }

    // MARK: - Private methods
    private func fire<T>(request: RestRequest, type: T.Type, callback: @escaping (T?, Error?) -> Void) where T: Codable {
        let urlRequest = request.urlRequest
        session.dataTask(with: urlRequest) { [unowned self] (data, response, error) in
            self.logResponse(url: urlRequest.url, httpMethod: request.urlRequest.httpMethod, body: urlRequest.httpBody, data: data, response: response, error: error, header: request.urlRequest.allHTTPHeaderFields)
            guard let httpResponse = response as? HTTPURLResponse else {
                callback(nil, error)
                return
            }

            let response = self.getDataResponse(data: data, httpResponse: httpResponse, error: error)
            switch response {
            case .tokenExpired:
                callback(nil, error)
               // self.handleTokenExpired(request: request, type: type, callback: callback)
                // no data, no connection
            case .noData, .noConnection:
                callback(nil, error)
                // a server error occured (5xx)
            case .serverError:
                let serverError = CustomNetworkError.serverError
                //NetworkErrorPresenter.handleError(error: serverError)
                callback(nil, error ?? serverError)
                // a client error occured (4xx)
            case .clientError:
                let clientError = CustomNetworkError.clientError
                //NetworkErrorPresenter.handleError(error: CustomNetworkError.clientError)
                callback(nil, error ?? clientError)
                // a timeout error occured (408)
            case .clientErrorTimeout:
                let clientError = CustomNetworkError.clientErrorTimeout
                //NetworkErrorPresenter.handleError(error: CustomNetworkError.clientErrorTimeout)
                callback(nil, error ?? clientError)
                // no error
            case .success(let data):
                guard let entity = try? JSONDecoder().decode(type, from: data) else {
                    callback(nil, error)
                    return
                }
                callback(entity, error)
            }
        }.resume()
    }

    private func getDataResponse(data: Data?, httpResponse: HTTPURLResponse, error: Error?) -> CustomNetworkError {
        switch httpResponse.statusCode {
        case 401:
            return .tokenExpired
        case 408:
            return .clientErrorTimeout
        case 400...499:
            return .clientError
        case 500...599:
            return .serverError
        default:
            guard !self.isNetworkConnectionError(error: error) else {
                print("No Internet")

                return .noConnection
            }
            guard let data = data else {
                return .noData
            }
            return .success(data: data)
        }
    }

    private func url(_ url: String) -> URL? {
        let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        
        return URL(string: Constants.Application.baseUrl + encoded)
    }

    private func logResponse(url: URL?, httpMethod: String?, body: Data?, data: Data?, response: URLResponse?, error: Error?, header: [String: String]?) {
        var message = "START REST CALL\n===> HTTPMETHOD: \(httpMethod ?? "None")\n"
        message += "===> URL: \(url?.debugDescription ?? "None")\n"
        message += "===> Request Header: \(header.debugDescription)\n"
        let body = body?.prettyPrintedJSONString ?? "None"
        if body.count > 10000 {
            message += "===> BODY: \((body as NSString).substring(to: 10000))...\n"
        } else {
            message += "===> BODY: \(body)\n"
        }
        
        message += "===> RESPONSE: \(response?.debugDescription ?? "None")\n"
        message += "===> ERROR: \(error?.localizedDescription ?? "None")\n"
        let data = data?.prettyPrintedJSONString ?? "None"
        if data.count > 10000 {
            message += "===> DATA: \((data as NSString).substring(to: 10000))...\n"
        } else {
            message += "===> DATA: \(data)\n"
        }
        print(message + "\n\nEND REST CALL\n")
    }

    private func isNetworkConnectionError(error: Error?) -> Bool {
        return error?._code == NSURLErrorNotConnectedToInternet
    }
}

extension CustomNetworkError: LocalizedError {
    public var title: String {
        return "COMMUNICATION ERROR"
    }

    public var message: String {
        switch self {
        case .serverError:
            return "Server Error"
        case .noConnection:
            return ""
        case .clientError:
            return "Client Error"
        case .clientErrorTimeout:
            return "Timeout"
        case .noData:
            return ""
        case .tokenExpired:
            return ""
        case .success(_):
            return ""
        }
    }
}
