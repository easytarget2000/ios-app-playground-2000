//
//  CounterValueRepository.swift
//  MobileAppPlayground
//
//  Created by Michel Sievers  on 2024-10-24.
//

protocol CounterValueRepository: Sendable {
    func fetchValue() async throws -> Int
    func setValue(_ value: Int) async throws
}
