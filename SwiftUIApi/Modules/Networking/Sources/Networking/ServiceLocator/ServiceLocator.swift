//
//  File.swift
//  
//
//  Created by  inna on 26/01/2021.
//


protocol ServiceLocating {
    func getService<T>() -> T?
}

final class ServiceLocator: ServiceLocating {
    
    public static let shared = ServiceLocator()

    private lazy var services: Dictionary<String, Any> = [:]

    private func typeName(some: Any) -> String {
        return (some is Any.Type) ?
            "\(some)" : "\(type(of: some))"
    }

    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        print(key)
        services[key] = service
    }

    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        print(key)
        return services[key] as? T
    }
}

